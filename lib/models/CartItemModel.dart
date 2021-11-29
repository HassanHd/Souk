class CartItemModel {
  String id;
  String image;
  String name;
  int quantity;
  double cost;
  String productId;
  double price;

  CartItemModel({
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.cost,
    required this.productId,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'image': this.image,
      'name': this.name,
      'quantity': this.quantity,
      'cost': this.cost,
      'productId': this.productId,
      'price': this.price,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as String,
      image: map['image'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      cost: map['cost'] as double,
      productId: map['productId'] as String,
      price: map['price'] as double,
    );
  }
}