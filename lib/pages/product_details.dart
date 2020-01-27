import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_old_price;
  final product_detail_picture;
  final product_detail_new_price;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('SupMart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
            footer: new Container(
              color: Colors.white70,
              child: ListTile(
                leading: new Text(widget.product_detail_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                title: new Row(
                  children: <Widget>[
                    // Expanded(
                    //   child: new Text("\$${widget.product_detail_old_price}",
                    //   style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),
                    // ),

                    // Expanded(
                    //   child: new Text("\$${widget.product_detail_new_price}", 
                    //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
                    // ),

                ],
                ),
                ),
            ),
              ),
          ),

          // First Buttons

          Row(
            children: <Widget>[

              // The Size Buttons

              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Choose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    });
                  },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Size"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
                ),
                ),

              // The Second Size Buttons

              Expanded(
                child: MaterialButton(
                    onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Colors"),
                        content: new Text("Choose a color"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    });
                  },
                color: Colors.red,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Colour"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
                ),
                ),

              // The Third Size Buttons

              Expanded(
                child: MaterialButton(
                    onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the quantity"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close"),)
                        ],
                      );
                    });
                  },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Qty"),
                    ),

                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
                ),
                ),
            ],
          ), 
          
          // Second Buttons

          Row(
            children: <Widget>[

              // The Size Buttons

              Expanded(
                child: MaterialButton(onPressed: (){},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Buy Now")
                ),
                ),

                new IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){}, color: Colors.red,),

                new IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){}, color: Colors.red),

            ],
          ), 
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text("desciption"),
          ),
          Divider(),
      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product name", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text(widget.product_detail_name),)
      ],
      ),

      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child: new Text("Product brand", style: TextStyle(color: Colors.grey),),),

            //REMEMBER TO CREATE THE PRODUCT BRAND
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text("Brand X"),)
      ],
      ),

      //ADD THE PRODUCT CONDITION

      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child: new Text("Product condition", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
            child: new Text("NEW"),)
      ],
      ),
        ],
      ),
    );
  }
}