import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/pages/category/categories_screen.dart';

class HomeCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  final bool isHome;

  const HomeCategory(
      {Key? key, required this.categoryModel, required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => CategoriesScreen(categoryModel: categoryModel)),
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0.0, 10.0, 0.0),
          child: Row(
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      categoryModel.image!,
                    ),
                  )),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 8.0),
                  Text(
                    categoryModel.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
