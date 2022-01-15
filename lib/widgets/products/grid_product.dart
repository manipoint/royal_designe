import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/pages/details.dart';
import 'package:royal_designe/responsive.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/loading_icon.dart';

import '../smooth_star_rating.dart';

class GridProduct extends StatelessWidget {
  final ProductModel product;

  const GridProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.shortestSide / 2.5
                : Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.shortestSide / 3
                    : MediaQuery.of(context).size.shortestSide / 2,
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.shortestSide / 2.6
                : Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.shortestSide / 2.4
                    : MediaQuery.of(context).size.shortestSide / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: [
                  const Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    ),
                  ),
                  Center(
                    child: Image(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        product.picture!,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: Responsive.isDesktop(context) || Responsive.isTablet(context)
                ? 20
                : -18.0,
            bottom: 
            Responsive.isDesktop(context) || Responsive.isTablet(context)
                ? 80:
            60.0,
            child: RawMaterialButton(
              onPressed: () =>
                  cartController.addProductToCart(product, context),
              fillColor: Colors.white,
              shape: const CircleBorder(),
              elevation: 4.0,
              child:  Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: Responsive.isDesktop(context) || Responsive.isTablet(context)
                ? 30
                : 20.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 3,
            child: Text(
              product.name!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                  starCount: 5,
                  color: AppThemes.ratingBG,
                  allowHalfRating: true,
                  rating: product.rating!,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  product.rating.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductDetails(
                product: product,
              );
            },
          ),
        );
      },
    );
  }
}
