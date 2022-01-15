
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/widgets/badge.dart';

import '../notifications.dart';
import 'cat_single_product.dart';

class CategoriesScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoriesScreen({Key? key, required this.categoryModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          "Categories",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: () => Get.to(const Notifications()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10.0),
            //  ignore: sized_box_for_whitespace

            const SizedBox(height: 20.0),
            Text(
              categoryModel.name!,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Divider(),
            const SizedBox(height: 10.0),
            StreamBuilder<List<ProductModel>>(
              stream: productController.getCatProducts(categoryModel.name!),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.25),
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return SingleProductWidget(
                            product: snapshot.data![index]);
                      });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
