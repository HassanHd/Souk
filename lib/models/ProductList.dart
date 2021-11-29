class ProductList{
int id;
String name;
String reqular_price;
String sale_price;
String stock_status;
String main_image;
String short_descripation;

ProductList({
    required this.id,
    required this.name,
    required this.reqular_price,
    required this.sale_price,
    required this.stock_status,
    required this.main_image,
    required this.short_descripation,
  });

Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'reqular_price': this.reqular_price,
      'sale_price': this.sale_price,
      'stock_status': this.stock_status,
      'main_image': this.main_image,
      'short_descripation': this.short_descripation,
    };
  }

  factory ProductList.fromMap(Map<String, dynamic> map) {
    return ProductList(
      id: map['id'] as int,
      name: map['name'] as String,
      reqular_price: map['reqular_price'] as String,
      sale_price: map['sale_price'] as String,
      stock_status: map['stock_status'] as String,
      main_image: map['main_image'] as String,
      short_descripation: map['short_descripation'] as String,
    );
  }
}