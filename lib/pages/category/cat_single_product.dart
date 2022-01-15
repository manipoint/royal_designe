import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/widgets/smooth_star_rating.dart';

import '../details.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        product.picture!,
                      )),
                ),
              ),
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {
                    cartController.addProductToCart(product, context);
                  },
                  fillColor: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 4.0,
                  child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.red,
                      )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              product.name!,
              style: const TextStyle(
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
                  rating: product.rating!,
                  size: 10.0,
                ),
                Text(
                  product.rating.toString(),
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
