import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/user_model.dart';
import 'package:royal_designe/util/loading_icon.dart';
import 'package:royal_designe/widgets/upload_image.dart';

import '../custom_text.dart';


class CustomItem extends StatelessWidget {
  final CartModel cartItem;

  const CustomItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () {
                    const Loading();
                    Get.to(UploadImage(cartItem: cartItem));
                  },
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
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                          image: CachedNetworkImageProvider(cartItem.picture!),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                        Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: IconButton(icon: Icon(Icons.minimize, color: Theme.of(context).colorScheme.secondaryVariant),onPressed: () {
                          const Loading();
                        cartController.decreaseQuantity(cartItem);
                        },),),
                     
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomText(
                        text: cartItem.quantity.toString(),
                        size: 25,
                      ),
                    ),
                      IconButton(icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondaryVariant),onPressed: () {
                        const Loading();
                      cartController.increaseQuantity(cartItem);
                      },),
                  ],
                ),
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
      ),
    );
  }
}
