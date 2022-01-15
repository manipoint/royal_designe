class ProductModel {
  String? id;
  String? name;
  String? picture;
  String? description;
  String? review;
  double? price;
  double? rating;
  bool? feature;

  ProductModel({
    this.id,
    this.name,
    this.picture,
    this.description,
    this.review,
    this.price,
    this.rating,
    this.feature,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    picture = data["picture"];
    description = data["description"];
    review = data["review"];
    price = data["price"].toDouble();
    rating = data["rating"].toDouble();
    feature = data["feature"];
  }
}

class FeatureModel {
  String? id;
  String? name;
  String? picture;
  String? description;
  double? price;
  bool? feature;

  FeatureModel({
    this.id,
    this.name,
    this.picture,
    this.description,
    this.price,
    this.feature,
  });

  FeatureModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    picture = data["picture"];
    description = data["description"];
    price = data["price"].toDouble();
    feature = data["feature"];
  }

  Map? toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "price": price,
      };
}
class CategoryModel{
  int? id;
  String? name;
  String? image;

   CategoryModel(
      {this.id,
      this.name,
      this.image,
});
  CategoryModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
  }
}
