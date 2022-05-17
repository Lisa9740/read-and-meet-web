import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../api.conf.dart';
import '../../models/book.dart';

class BookApiProvider with ChangeNotifier{
  final String? authToken;
  BookApiProvider({this.authToken});
  final successCode = 200;

  getByPostId(id) async{
    String url = "${ApiConf.baseUrl}/book/post/$id";
    var headers = await ApiConf.getHeaders(authToken);
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.body);
      return parseResponse(response);
    } catch (e) {
      print(e);
      return List<Book>.empty();
    }
  }

  getAll() async{
    String url = "${ApiConf.baseUrl}/books";
    var headers = await ApiConf.getHeaders(authToken);
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      return parseResponse(response);
    } catch (e) {
      print(e);
      return List<Book>.empty();
    }
  }

  getSuggestions(String pattern) async {
    var result;
    if (pattern != '') {
      result = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=' +
          Uri.encodeFull(pattern) +
          '&key=AIzaSyBOqgUQhwLpEcOHLJJz48yHq6AO22rYHg0', ) ,  headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS,
        "Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers"

        "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
      });
      if (result.statusCode == successCode) {
        Map<String, dynamic> json = jsonDecode(result.body);
        List finish = [];


        for (int i = 0; i < json['items'].length; i++) {
          var image = "";
          print(image);
          if ( json['items'][i]['volumeInfo']['imageLinks'] != null) {
            image = json['items'][i]['volumeInfo']['imageLinks']['thumbnail'].toString();
          }

          finish.add({
            "title" : json['items'][i]['volumeInfo']['title'].toString(),
            "description" : json['items'][i]['volumeInfo']['description'].toString(),
            "author" : json['items'][i]['volumeInfo']['authors'].toString(),
            "image" : image,
          });
        }

        return finish;
      } else {
        throw Exception('Failed to fetch.');
      }
    }
  }


  Future<String> getBookImage(imageName) async {
    var headers = await ApiConf.getHeaders(authToken);
    var image = imageName.split("/").last;
    String url = "${ApiConf.baseUrl}/post/image/$image";

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    print("bookImage ${response.body}");

    var data = jsonDecode(response.body);
    var path;
    if (data.length != 0) {
      path = data[0]['path']
          .split('/')
          .last;
    }
    var urlImage = "${ApiConf.mainBaseUrl}/storage/photos/$path";


    print(urlImage);
    return urlImage;
  }

  List<Book> parseResponse(http.Response response) {
    final responseString = response.body;
    try {
      if (response.statusCode == successCode) {
        return BookFromJson(responseString);
      }
      throw Exception('failed to load books ');
    }catch(e){
      print(e);
      throw Exception('failed to load request');
    }
  }
}