import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../api.conf.dart';
import '../../models/post.dart';


class PostApiProvider with ChangeNotifier{
  PostApiProvider({this.authToken});

  final String? authToken;
  final successCode = 200;
  var posts = [];

  Future<List<Post>> fetchPosts() async{
    String url = "${ApiConf.baseUrl}/posts";
    try {
      var headers = await ApiConf.getHeaders(authToken);
      var response = await http.get(Uri.parse(url), headers: headers);
      return parseResponse(response);
    }catch(e){
      print("error fetchPost $e");
      return List.empty();
    }
  }


  List<Post> parseResponse(http.Response response) {
    final responseString = response.body;
    if (response.statusCode == successCode) {
      posts = postsFromJson(responseString);
      notifyListeners();
      return postsFromJson(responseString);
    } else {
      throw Exception('failed to parse posts data');
    }
  }

}