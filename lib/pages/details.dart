import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/responsive.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/loading_icon.dart';
import 'package:royal_designe/widgets/badge.dart';
import 'package:royal_designe/widgets/smooth_star_rating.dart';
import 'cart.dart';
import 'notifications.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);
  //bool isFav = false;
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
          "Item Details",
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
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              const SizedBox(height: 4.0),
              Stack(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.longestSide / 1.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(product.picture!,
                              scale: 6),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: Responsive.isDesktop(context)
                          ? 60.0
                          : Responsive.isTablet(context)
                              ? -20
                              : -10,
                      bottom: 3.0,
                      child: RawMaterialButton(
                          onPressed: () =>
                              cartController.addProductToCart(product, context),
                          fillColor: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 6.0,
                          child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.add_shopping_cart_sharp,
                                color: Colors.red,
                                size: 40,
                              )))),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  product.name!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 2.0, left: 8),
                child: Row(
                  children: <Widget>[
                    SmoothStarRating(
                      starCount: 5,
                      color: AppThemes.ratingBG,
                      allowHalfRating: true,
                      rating: product.rating,
                      size: 12.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      "${product.rating.toString()} (23 Reviews)",
                      style: const TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 2.0, left: 8),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "1 Piece only in ",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Product Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  product.description!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Custumization",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                    child: TextFormField(
                      maxLines: 2,
                      controller: authController.customName,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(.3),
                          border: InputBorder.none,
                          hintText: "What you want to print "),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                    child: TextFormField(
                      maxLines: 4,
                      controller: authController.customDis,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(.3),
                          border: InputBorder.none,
                          hintText: "Add Discription if any"),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primaryVariant,
                        elevation: 8,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(vertical: 12)),
                    onPressed: () => selectImage(context),
                    child: Obx(
                      () => productController.xFile.value == null
                          ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 34),
                            child: Text(
                                "Upload Image",
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary),
                              ),
                          )
                          : Center(
                              child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                    height: MediaQuery.of(context)
                                            .size
                                            .shortestSide /
                                        1.1,
                                    width: Responsive.isDesktop(context)
                                        ? MediaQuery.of(context)
                                                .size
                                                .shortestSide *
                                            1.2
                                        : Responsive.isTablet(context)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .shortestSide *
                                                1.2
                                            : MediaQuery.of(context)
                                                    .size
                                                    .shortestSide *
                                                1.2,
                                  ),
                                  child: productController.previewImage())),
                    ),
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 180, height: 60),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primaryVariant,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () async {
                        const Loading();
                        await cartController.buyProduct(product, context,
                            authController.userModel.value.email, product.name);
                        Get.defaultDialog(
                          cancelTextColor: Theme.of(context).colorScheme.error,
                          confirmTextColor: Colors.green,
                  
                            title: "Confirm Order",
                            middleText: "Are You Sure to Buy Product",
                            onCancel: () {
                              authController.updateUserData({"cart": []});
                              navigator!.pop(context);
                            },
                            onConfirm: () =>
                                paymentController.conformOrder(context));
                      },
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 180, height: 60),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primaryVariant,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed:()=>Get.to(const CartScreen()),
                      child: Text(
                        "View Cart",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ),

              // ListView.builder(
              //   shrinkWrap: true,
              //   primary: false,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: comments.length,R
              //   itemBuilder: (BuildContext context, int index) {
              //     Map comment = comments[index];
              //     return ListTile(
              //       leading: const CircleAvatar(
              //         radius: 25.0,
              //         // backgroundImage: AssetImage(
              //         //   "${comment['img']}",
              //         // ),
              //       ),
              //       title: Text("${comment['name']}"),
              //       subtitle: Column(
              //         children: <Widget>[
              //           Row(
              //             children: <Widget>[
              //               SmoothStarRating(
              //                 starCount: 5,
              //                 color: AppThemes.ratingBG,
              //                 allowHalfRating: true,
              //                 rating: 5.0,
              //                 size: 12.0,
              //               ),
              //               const SizedBox(width: 6.0),
              //               const Text(
              //                 "February 14, 2021",
              //                 style: TextStyle(
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w300,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           // const SizedBox(height: 7.0),
              //           Text(
              //             "${comment["comment"]}",
              //           ),
              //           const SizedBox(height: 30.0),
              //         ],
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(height: 30.0),
            ],
          ),
          // PositionButton(
          //     fontWeight: FontWeight.w700,
          //     fontSize: 18,
          //     positionheight: 40,
          //     positionLeft: 80,
          //     positionRight: 80,
          //     positionBottom: 10,
          //     borderRadius: BorderRadius.circular(12.0),
          //     onTab: () {
          //       Get.to(const CartScreen());
          //     },
          //     text: 'View Cart'),
        ],
      ),
    );
  }

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Upload image to print on ${product.name}",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          children: <Widget>[
            SimpleDialogOption(
                child: const Text("Photo with Camera"),
                onPressed: () => productController.handleTakePhoto(context)),
            SimpleDialogOption(
                child: const Text("Image from Gallery"),
                onPressed: () =>
                    productController.handleChooseFromGallery(context)),
            SimpleDialogOption(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
