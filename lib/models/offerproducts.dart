class offerproducts{
int id;
int brand_id;
int quantity;
String name;
String slug;
String reqular_price;
String sale_price;
String main_image;
String short_descripation;
String descripation;

offerproducts({
    required this.id,
    required this.brand_id,
    required this.quantity,
    required this.name,
    required this.slug,
    required this.reqular_price,
    required this.sale_price,
    required this.main_image,
    required this.short_descripation,
    required this.descripation,
  });

Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'brand_id': this.brand_id,
      'quantity': this.quantity,
      'name': this.name,
      'slug': this.slug,
      'reqular_price': this.reqular_price,
      'sale_price': this.sale_price,
      'main_image': this.main_image,
      'short_descripation': this.short_descripation,
      'descripation': this.descripation,
    };
  }

  factory offerproducts.fromMap(Map<String, dynamic> map) {
    return offerproducts(
      id: map['id'] as int,
      brand_id: map['brand_id'] as int,
      quantity: map['quantity'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
      reqular_price: map['reqular_price'] as String,
      sale_price: map['sale_price'] as String,
      main_image: map['main_image'] as String,
      short_descripation: map['short_descripation'] as String,
      descripation: map['descripation'] as String,
    );
  }
}