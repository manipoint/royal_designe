import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/pages/details.dart';
import 'package:royal_designe/util/loading_icon.dart';

import '../responsive.dart';

class SliderItem extends StatelessWidget {
  final ProductModel product;

  const SliderItem({Key? key, required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:
          Stack(
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                          color: Theme.of(context).colorScheme.primary.withOpacity(.6),
                height:Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 3
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width / 2
                        : MediaQuery.of(context).size.width / 1.2,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(children: [
                    const Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Center(
                      child: Container(
                               color: Theme.of(context).colorScheme.primary,
                        child: Image(
                          image: CachedNetworkImageProvider(
                            product.picture!,
                          ),
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
           
         
          Positioned(
            bottom: 30,
            left: 12,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0, top: 8.0),
              child: Text(
                product.name!,
                style: TextStyle(
                   color: Theme.of(context).colorScheme.primaryVariant,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 2,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Row(
              children: <Widget>[
                Text(
                  product.price!.toString(),
                  style: TextStyle(
                     color: Theme.of(context).colorScheme.primaryVariant,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
          ],
          ),
      onTap: () {
        Get.to(ProductDetails(
          product: product,
        ));
      },
    );
  }
}
