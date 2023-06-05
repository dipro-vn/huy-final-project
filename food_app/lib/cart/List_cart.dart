class Cart {
  String? image;
  String? name;
  num? price;
  num? quantity;

  Cart(
      {required this.image,
      required this.name,
      required this.price,
      required this.quantity});
}

List<Cart> cart = <Cart>[];
