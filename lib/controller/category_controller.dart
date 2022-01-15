import 'package:get/get.dart';
import 'package:royal_designe/constants/firebase.dart';
import 'package:royal_designe/model/product_model.dart';


class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<CategoryModel> categoryList= RxList<CategoryModel>();
 

 
  String collection = "categories";

 @override
  void onReady() {
    super.onReady();
    categoryList.bindStream(getAllCategory());
  
  }

      Stream<List<CategoryModel>> getAllCategory() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => CategoryModel.fromMap(item.data())).toList());
    
}
