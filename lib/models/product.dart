class Product {
  final String name;
  final String shop;
  final int number;

  Product({this.name, this.shop, this.number});

  Map<String, dynamic> toJson() => {
    'name': name,
    'shop': shop,
    'number': number
  };
}