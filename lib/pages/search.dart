

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';

import 'details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  String? selectedPeriod;
  String? selectedCategory;
  String? selectedPrice;

  List<ProductModel> products = productController.products;
  RxList<ProductModel> searchResults = RxList<ProductModel>([]);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _getLowerLayer() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(.3),
                ),
            child: TextField(
              controller: authController.searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  List<ProductModel> tempList = <ProductModel>[];
                  for (var product in products) {
                    if (product.name!.toLowerCase().contains(value)) {
                      tempList.add(product);
                    }
                  }
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(tempList);
                  });
                  return;
                } else {
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(products);
                  });
                }
              },
              cursorColor: Theme.of(context).colorScheme.onBackground,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  suffix: TextButton(
                      onPressed: () {
                        authController.searchController.clear();
                        searchResults.clear();
                      },
                      child:const Padding(
                        padding: EdgeInsets.only(right:12.0),
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.red),
                        ),
                      ))),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListTile(
                      onTap: () =>
                          Get.to(ProductDetails(product: searchResults[index])),
                      title: Text(searchResults[index].name!),
                    ))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getLowerLayer(),
    );
  }
}
