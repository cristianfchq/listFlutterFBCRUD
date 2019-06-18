import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Product{
  String _id;
  String _name;
  String _codebar;
  String _description;
  String _price;
  String _stock;

  Product(
    this._id,
    this._name,
    this._codebar,
    this._description,
    this._price,
    this._stock,
  );

  Product.map(dynamic object){
    this._name = object['name'];
    this._codebar = object['codebar'];
    this._description = object['description'];
    this._price = object['price'];
    this._stock = object['stock'];
  }

  String get id => _id;
  String get name => _name;
  String get codebar => _codebar;
  String get description => _description;
  String get price => _price;
  String get stock => _stock;

  Product.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _codebar = snapshot.value['codebar'];
    _description = snapshot.value['description'];
    _price = snapshot.value['price'];
    _stock = snapshot.value['stock'];
  }

}