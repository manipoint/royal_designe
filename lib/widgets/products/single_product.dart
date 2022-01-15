import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/pages/details.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/loading_icon.dart';

import '../smooth_star_rating.dart';

class SingleProduct extends StatelessWidget {
  final ProductModel productModel;
  final bool? isFav;

  const SingleProduct(
      {Key? key, required this.productModel, required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: <Widget>[
                    const Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    Center(
                      child: Image(
                          image: CachedNetworkImageProvider(
                        productModel.picture!,
                        maxHeight: MediaQuery.of(context).size.width ~/ 2.4,
                        maxWidth: MediaQuery.of(context).size.width ~/ 1.5,
                      )),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      isFav! ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              productModel.name!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                  starCount: 5,
                  color: AppThemes.ratingBG,
                  allowHalfRating: true,
                  rating: productModel.rating,
                  size: 10.0,
                ),
                Text(
                  " ${productModel.rating} (${productModel.rating} Reviews)}",
                  style: const TextStyle(
                    fontSize: 11.0,
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
              return ProductDetails(product: productModel);
            },
          ),
        );
      },
    );
  }
}
