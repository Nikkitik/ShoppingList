import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist/models/product.dart';
import 'package:shoppinglist/screens/add_shop.dart';
import 'package:shoppinglist/screens/product_list.dart';
import 'package:shoppinglist/services/database.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddShop();
                    },
                  );
                },
              ),
            ],
            title: Text('Мои покупки'),
            elevation: 10.0,
          ),
          body: ProductList()),
    );
  }
}
