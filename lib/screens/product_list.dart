import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist/models/product.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context) ?? [];

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Text(products[index].name);
      },
    );
  }
}