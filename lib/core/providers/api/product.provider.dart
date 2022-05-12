import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../api.conf.dart';
import '../../models/product.dart';


class ProductApiProvider with ChangeNotifier{
  ProductApiProvider({this.authToken});

  final String? authToken;
  final successCode = 200;
  var products = [];

  Future<List<Product>> fetchProducts() async{
    String url = "${ApiConf.baseUrl}/books";
    try {
      var headers = await ApiConf.getHeaders(authToken);
      var response = await http.get(Uri.parse(url), headers: headers);
      return parseResponse(response);
    }catch(e){
      print("error fetchProduct $e");
      return List.empty();
    }
  }


  List<Product> parseResponse(http.Response response) {
    final responseString = response.body;
    if (response.statusCode == successCode) {
      products = ProductFromJson(responseString);
      notifyListeners();
      return ProductFromJson(responseString);
    } else {
      throw Exception('failed to parse Products data');
    }
  }

}