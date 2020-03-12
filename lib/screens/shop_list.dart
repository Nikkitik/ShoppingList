import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist/models/shop.dart';

class ShopList extends StatefulWidget {
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Shop>>(context) ?? [];
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Text(categories[index].name);
      },
    );
  }
}