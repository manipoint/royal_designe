import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/user_model.dart';

import '../responsive.dart';

class UploadImage extends StatelessWidget {
  final CartModel cartItem;
  const UploadImage({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => productController.xFile.value == null
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context)),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'app.title'.tr,
              ),
              elevation: 0.0,
            ),
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.shortestSide / 2
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.shortestSide / 1.8
                        : MediaQuery.of(context).size.shortestSide / 1.2,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/upload.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text(
                            "Select Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          color: Colors.deepOrange,
                          onPressed: () => selectImage(context)),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => productController.clearImage()),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'app.title'.tr,
              ),
              elevation: 0.0,
            ),
            body: ListView(children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Center(
                  child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        height: MediaQuery.of(context).size.shortestSide / 1.1,
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.shortestSide * 1.2
                            : Responsive.isTablet(context)
                                ? MediaQuery.of(context).size.shortestSide * 1.2
                                : MediaQuery.of(context).size.shortestSide *
                                    1.2,
                      ),
                      child: productController.previewImage())),
              Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 180, height: 60),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primaryVariant,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () => productController.handleSubmit(
                          cartItem: cartItem,
                          fileName: cartItem.name,
                          pathName: cartItem.id),
                      child: Text(
                        "Upload Image",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Upload image to print on ${cartItem.name}",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          children: <Widget>[
            SimpleDialogOption(
                child: const Text("Photo with Camera"),
                onPressed: () => productController.handleTakePhoto(context)),
            SimpleDialogOption(
                child: const Text("Image from Gallery"),
                onPressed: () =>
                    productController.handleChooseFromGallery(context)),
            SimpleDialogOption(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
