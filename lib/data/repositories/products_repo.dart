import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsData with ChangeNotifier{
  final allData = [];
  Future<void> fetchProducts() async{
    var url = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (url.statusCode == 200){
      var result = json.decode(url.body);
      print(result);
      allData.addAll(result);
      notifyListeners();
    }else{
      throw Exception("ERROR!");
    }
  }
}