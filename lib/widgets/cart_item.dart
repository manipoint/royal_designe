import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/user_model.dart';

import 'package:royal_designe/util/loading_icon.dart';

import 'custom_text.dart';

class CartItem extends StatelessWidget {
  final CartModel cartItem;

  const CartItem({Key? key, required this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
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
                        cartItem.picture!,
                      ),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 14),
                child: CustomText(
                  text: cartItem.name,
                  weight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ),
                    onPressed: () {
                      cartController.decreaseQuantity(cartItem);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 2, top: 5),
                  child: CustomText(
                    text: cartItem.quantity.toString(),
                    size: 25,
                  ),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 40,
                    ),
                    onPressed: () => cartController.increaseQuantity(cartItem)),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: CustomText(
            text: cartItem.cost.toString(),
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
