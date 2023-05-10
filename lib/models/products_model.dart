class ProductsModel {
  String? id;
  String? name;
  String? category;
  double? price;
  String? color;
  List<String>? size;
  String? description;
  List<String>? images;
  List<Reviews>? reviews;

  ProductsModel(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.color,
      this.size,
      this.description,
      this.images,
      this.reviews});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    color = json['color'];
    size = json['size'].cast<String>();
    description = json['description'];
    images = json['images'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['price'] = price;
    data['color'] = color;
    data['size'] = size;
    data['description'] = description;
    data['images'] = images;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? id;
  String? user;
  int? rating;
  String? comment;

  Reviews({this.id, this.user, this.rating, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['rating'] = rating;
    data['comment'] = comment;
    return data;
  }
}
