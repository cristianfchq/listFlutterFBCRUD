import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterejemplofb/model/product.dart';

class ProductScreen extends StatefulWidget {

  final Product product;
  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

final productRefernece = FirebaseDatabase.instance.reference().child('product');

class _ProductScreenState extends State<ProductScreen> {

  List<Product> items;
  TextEditingController _nameControler;
  TextEditingController _codebarControler;
  TextEditingController _descriptionControler;
  TextEditingController _priceControler;
  TextEditingController _stockControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameControler = new TextEditingController(text: widget.product.name);
    _codebarControler = new TextEditingController(text: widget.product.name);
    _descriptionControler = new TextEditingController(text: widget.product.description);
    _priceControler = new TextEditingController(text: widget.product.price);
    _stockControler = new TextEditingController(text: widget.product.stock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Product DB'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nameControler,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: 'Name',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                ),
                Divider(),
                TextField(
                  controller: _codebarControler,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                    ),
                    labelText: 'Codebar',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                ),
                Divider(),
                TextField(
                  controller: _descriptionControler,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.list,
                    ),
                    labelText: 'Description',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                ),
                Divider(),
                TextField(
                  controller: _priceControler,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.monetization_on,
                    ),
                    labelText: 'Price',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                ),
                Divider(),
                TextField(
                  controller: _stockControler,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.shop,
                    ),
                    labelText: 'Stock',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                  ),
                ),
                Divider(),
                FlatButton(
                  onPressed: (){
                    if(widget.product.id != null){
                      productRefernece.child(widget.product.id).set({
                        'name' : _nameControler.text,
                        'codebar' : _codebarControler.text,
                        'description' : _descriptionControler.text,
                        'price' : _priceControler.text,
                        'stock' : _stockControler.text,
                      }).then((_){
                        Navigator.pop(context);
                      });
                    }
                    else{
                      productRefernece.push().set({
                        'name' : _nameControler.text,
                        'codebar' : _codebarControler.text,
                        'description' : _descriptionControler.text,
                        'price' : _priceControler.text,
                        'stock' : _stockControler.text,
                      }).then((_){
                        Navigator.pop(context);
                      });
                    }
                  }, 
                  child: (widget.product.id != null) ? Text('Update') : Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}