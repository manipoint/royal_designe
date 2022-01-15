import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/constants/firebase.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/model/user_model.dart';
import 'package:royal_designe/pages/checkout.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>();
  RxList<ProductModel> featureProducts = RxList<ProductModel>();
  RxList<ProductModel> categoryProducts = RxList<ProductModel>();

  Rx<ProductModel?> productModel = ProductModel().obs;
  Rx<CategoryModel?> catModel = CategoryModel().obs;

  String collection = "products";

  Rx<XFile?> xFile = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();
  Rx<String> productImageFileName = "".obs;
  dynamic _pickImageError;
  Rx<bool> isUploading = false.obs;
  @override
  @override
  void onInit() {
    categoryProducts.bindStream(getAllProducts());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
    featureProducts.bindStream(getFeatureProducts());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());

  Stream<List<ProductModel>> getFeatureProducts() {
    return firebaseFirestore
        .collection(collection)
        .where('feature', isEqualTo: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ProductModel.fromMap(e.data())).toList());
  }

  getCatProducts(String name) {
    return firebaseFirestore
        .collection(collection)
        .where('category', isEqualTo: name)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ProductModel.fromMap(e.data())).toList());
  }

  handleTakePhoto(context) async {
    Navigator.pop(context);
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      xFile.value = pickedFile;
      update();
    } catch (error) {
      _pickImageError = error;
      update();
      Get.snackbar("Error", "Unable to get Image");
    }
  }

  handleChooseFromGallery(context) async {
    Navigator.pop(context);
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      xFile.value = pickedFile;
      update();
    } catch (error) {
      _pickImageError = error;
      update();
      Get.snackbar("Error", "Unable to get Image");
    }
  }

  previewImage() {
    if (xFile.value != null) {
      if (kIsWeb) {
        return Image.network(xFile.value!.path);
      } else {
        return Semantics(
            child: Image.file(File(xFile.value!.path)),
            label: 'image');
      }
    } else if (_pickImageError != null) {
      return Get.snackbar("Error", _pickImageError, colorText: Colors.red);
    } else {
      return Get.snackbar("Error", "You have not yet picked an image",
          colorText: Colors.red);
    }
  }

  Future<String> uploadImageFile(
      XFile file, String? imageFileName, pathName) async {
    UploadTask uploadTask;
    final metadata = SettableMetadata(
        contentType: imageFileName,
        customMetadata: {'picked-file-path': file.path});

    Reference reference = storage.ref();
    if (kIsWeb) {
      uploadTask = reference
          .child("orders")
          .child(imageFileName!)
          .child(pathName)
          .putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = reference
          .child("orders")
          .child(imageFileName!)
          .child(pathName)
          .putFile(File(file.path));
    }
    TaskSnapshot snapshot = await uploadTask.then((value) => value);
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  handleSubmit(
      {CartModel? cartItem, String? fileName, String? pathName}) async {
    isUploading.value = true;

    String mediaUrl = await uploadImageFile(xFile.value!, fileName, pathName);
    authController.updateUserData({
      "cart": FieldValue.arrayRemove([
        {
          "id": cartItem!.id,
          "productId": cartItem.productId,
          "name": cartItem.name,
          "quantity": cartItem.quantity,
          "price": cartItem.price,
          "picture": cartItem.picture,
          "cost": cartItem.cost
        }
      ])
    });
    authController.updateUserData({
      "cart": FieldValue.arrayUnion([
        {
          "id": cartItem.id,
          "productId": cartItem.productId,
          "name": cartItem.name,
          "quantity": cartItem.quantity,
          "price": cartItem.price,
          "picture": mediaUrl,
          "cost": cartItem.cost
        }
      ])
    });

    clearImage();
    Get.to(const CartPage());
  }

  clearImage() {
    xFile.value = null;
  }
}
