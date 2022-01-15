import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/widgets/badge.dart';
import 'package:royal_designe/widgets/products/grid_product.dart';

import '../responsive.dart';
import 'notifications.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Best Seller",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
    
  
            const Divider(),
            Obx(() =>GridView.builder(
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
                return GridProduct(
                  product: productController.products[index],
                );
              },
            ),),
          ],
        ),
      ),
    );
  }
}
