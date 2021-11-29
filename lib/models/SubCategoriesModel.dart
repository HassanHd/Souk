class SubCategoriesModel{
  int id;
  int category_id;
  String brand;
  String images;

  SubCategoriesModel({
    required this.id,
    required this.category_id,
    required this.brand,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'category_id': this.category_id,
      'brand': this.brand,
      'images': this.images,
    };
  }
  factory SubCategoriesModel.fromMap(Map<String, dynamic> map) {
    return SubCategoriesModel(
      id: map['id'] as int,
      category_id: map['category_id'] as int,
      brand: map['brand'] as String,
      images: map['images'] as String,
    );
  }
}
