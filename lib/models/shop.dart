class Shop {
  final String name;

  Shop({this.name});

  Map<String, dynamic> toJson() => {
    'name': name
  };
}