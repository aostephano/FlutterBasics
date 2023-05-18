class ProductModel {
  final String id;
  final String title;

  ProductModel({
    required this.id,
    required this.title,
  });

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  //fromMap
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
    };
  }

  //fromJson
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
    );
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, title: $title}';
  }
}
