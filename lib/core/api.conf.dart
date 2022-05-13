import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:read_and_meet_web/core/storage/shared.pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConf {

  static String mainBaseUrl ="https://rad-backend.barret-alison-dev.xyz";
  static String baseUrl ="https://rad-backend.barret-alison-dev.xyz/api";

/*
 static String baseUrl = "http://rad-backend.barret-alison-dev.xyz/api";
  static String mainBaseUrl ="http://rad-backend.barret-alison-dev.xyz";

  static String socketUrl = "http://rad-backend-ws.barret-alison-dev.xyz";
*/

  static getAuthorizationHeaders(token) {
    return {"Authorization" : 'Bearer $token'};
  }


  static getHeaders(token)  async {
    Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};
    token = await SharedPref.getToken();
    if (token != null){
      var formattedToken = token;
      var basicToken = 'Bearer $formattedToken';
      headers = {HttpHeaders.authorizationHeader: basicToken,
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS,
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
      };
      return headers;
    }
    return headers;
  }

  static getMultiPartHeaders(token)  async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    token = await SharedPref.getToken();
    if (token != null){
      var formattedToken = token;
      var basicToken = 'Bearer $formattedToken';
      headers = {HttpHeaders.authorizationHeader: basicToken,
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS,
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
      };
      return headers;
    }
    return headers;
  }
}