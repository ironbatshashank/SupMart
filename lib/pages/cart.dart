import 'package:flutter/material.dart';

//My imports
import 'package:supmart/components/cart_products.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      
      body: new Cart_products(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("\$230"),
            ),),

            Expanded(
              child: new MaterialButton(
                onPressed: (){},
                child: new Text("Checkout", style: TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}