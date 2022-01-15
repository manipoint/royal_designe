class UserModel {
  Name? name;
  LocationModel? location;
  String? email;
  String? phone;
  String? id;
  Picture? picture;
  String? roll;
  List<CartModel>? cart;

  UserModel({
    this.name,
    this.location,
    this.email,
    this.phone,
    this.id,
    this.picture,
    this.roll,
    this.cart,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = Name.fromJson(json['name']);
    location = (json['location'] != null
        ? LocationModel.fromJson(json['location'])
        : null)!;
    email = json['email'] as String;

    phone = json['phone'] as String;
    roll = json['roll'] as String;

    id = json['id'] as String;
    picture = json['picture'] != null
        ? Picture.fromJson(json['picture'] as Map<String, Object>)
        : null;
    cart = _convertCartItems(json["cart"] as List);
  }
  List<CartModel> _convertCartItems(List cartFomDb) {
    List<CartModel> _result = [];
    if (cartFomDb.isNotEmpty) {
      for (var element in cartFomDb) {
        _result.add(CartModel.fromMap(element));
      }
    }
    return _result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['phone'] = phone;

    if (id != null) {
      data['id'] = id;
    }
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }

    return data;
  }
}

class Name {
  String? first;
  String? last;

  Name({this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class LocationModel {
  String? street;
  String? city;
  String? state;
  String? postcode;
  Coordinates? coordinates;

  LocationModel({
    this.street,
    this.state,
    this.postcode,
    this.coordinates,
  });

  LocationModel.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'].toString();
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['postcode'] = postcode;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }

    return data;
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String?, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class CartModel {
  String? id;
  String? productId;
  String? name;
  String? customName;
  String? discription;
  String? picture;
  int? quantity;
  double? cost;
  double? price;

  CartModel(
      {this.id,
      this.productId,
      this.name,
      this.customName,
      this.discription,
      this.picture,
      this.quantity,
      this.cost,
      this.price});
  CartModel.fromMap(Map? data) {
    id = data!["id"];
    productId = data["productId"];
    name = data["name"];
    customName = data["customName"];
    discription = data["discription"];
    picture = data["picture"];
    quantity = data["quantity"].toInt();
    cost = data["cost"].toDouble();
    price = data["price"].toDouble();
  }

  Map? toJson() => {
        "id": id,
        "productId": productId,
        "name": name,
        "customName":customName,
        "discription":discription,
        "picture": picture,
        "quantity": quantity,
        "cost": cost,
        "price": price,
      };
}
