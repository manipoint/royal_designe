import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/widgets/home_category.dart';
import 'package:royal_designe/widgets/products/grid_product.dart';
import 'package:royal_designe/widgets/slider_item.dart';

import '../responsive.dart';
import 'dishes.dart';

class Home extends StatelessWidget {
  const Home({Key? key, this.product}) : super(key: key);
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Best Seller",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                  onPressed: () {
                    Get.to(const ViewAllScreen());
                  },
                ),
              ],
            ),

            const SizedBox(height: 10.0),

            //Slider Here

            Obx(
              () => CarouselSlider(
                items: productController.featureProducts
                    .map((element) => SliderItem(product: element))
                    .toList(),
                options: CarouselOptions(
                  // autoPlayAnimationDuration: Duration(microseconds: 200),
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayCurve: Curves.easeInCubic,
                  height: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 2.6
                      : Responsive.isTablet(context)
                          ? MediaQuery.of(context).size.width / 1.2
                          : MediaQuery.of(context).size.width,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  // onPageChanged: (index, reason) {}
                ),
              ),
            ),
            // const SizedBox(height: 20.0),

            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10.0),

            Obx(() => SizedBox(
                  height: 95.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categoryController.categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeCategory(
                        isHome: true,
                        categoryModel: categoryController.categoryList[index],
                      );
                    },
                  ),
                )),

            const SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Popular Items",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                  onPressed: ()=>Get.to(const ViewAllScreen()),
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            Obx(() => GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isDesktop(context)
                          ? 4
                          : Responsive.isTablet(context)
                              ? 3
                              : 2,
                      childAspectRatio: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.shortestSide /
                              (MediaQuery.of(context).size.longestSide / 1.4)
                          : Responsive.isTablet(context)
                              ? MediaQuery.of(context).size.shortestSide /
                                  (MediaQuery.of(context).size.longestSide / .9)
                              : .68),
                  itemCount: productController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridProduct(
                        product: productController.products[index],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
