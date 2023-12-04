// The best way to handle network requests in Flutter
// Applications frequently need to perform POST and GET and other HTTP requests.
// Flutter provides an http package that supports making HTTP requests.

// HTTP methods: GET, POST, PATCH, PUT, DELETE

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resumee/config/api_string.dart';
import 'package:resumee/config/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpHandler {
  static String baseURL = APIString.baseURL;

  static Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(
      LocalStorage.token,
    );
    log("Token -- '$token'");
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<Map<String, dynamic>> formDataMethod(
      {required String url,
      Map<String, String>? body,
      String? imagePath,
      String? apiMethod,
      List<String>? imageList,
      String? imageKey}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(
      LocalStorage.token,
    );
    var request = http.MultipartRequest(
      (apiMethod ?? "POST").toUpperCase(),
      Uri.parse(
        "$baseURL$url",
      ),
    );
    log("POST FORM DATA URL ----  $request");
    request.headers.addAll(
      {
        if (token != null) 'Authorization': 'Bearer $token',
        'Content-Type':
            'multipart/form-data; boundary=<calculated when request is sent>'
      },
    );

    log("FORM DATA BODY :-  $body");

    if (imagePath != null) {
      log("image -- $imagePath");
      request.files.add(
        await http.MultipartFile.fromPath('$imageKey', imagePath),
      );
    }
    if (imageList != null) {
      for (var element in imageList) {
        request.files.add(
          await http.MultipartFile.fromPath('$imageKey', element),
        );
      }
    }
    if (body != null) {
      request.fields.addAll(body);
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    String responseString = String.fromCharCodes(responseData);
    log("RESPONSE = $responseString");
    log("RESPONSE CODE = ${response.statusCode}");

    if (response.statusCode == 200) {
      var data = json.decode(
        responseString,
      );
      Map<String, dynamic> returnRes = {
        'body': data,
        'error': null,
      };
      return returnRes;
    } else {
      Map<String, dynamic> returnRes = {
        'body': null,
        'error': responseString,
      };
      log('Something went wrong');
      return returnRes;
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod({
    @required String? url,
    bool isMockUrl = false,
  }) async {
    var header = await _getHeaders();

    log("Get URL -- '$baseURL$url'");
    log("Get Data -- 'null'");
    http.Response response = await http.get(
      Uri.parse(isMockUrl ? "$url" : "$baseURL$url"),
      headers: header,
    );
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> postHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    log("Post URL -- '$baseURL$url'");
    log("Post Data -- '$data'");
    http.Response response = await http.post(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> patchHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    log("Patch URL -- '$baseURL$url'");
    log("Patch Data -- '$data'");
    http.Response response = await http.patch(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> putHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    log("Put URL -- '$baseURL$url'");
    log("Put Data -- '$data'");
    http.Response response = await http.put(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> deleteHttpMethod({
    @required String? url,
  }) async {
    var header = await _getHeaders();
    log("Delete URL -- '$baseURL$url'");
    http.Response response =
        await http.delete(Uri.parse("$baseURL$url"), headers: header);
    var res = handler(response);
    return res;
  }

  static Map<String, dynamic> handler(http.Response response) {
    log("Delete Response Code -- '${response.statusCode}'");
    log("Delete Response -- '${response.body}'");
    if (response.statusCode == 200) {
      return {
        'body': jsonDecode(response.body),
        'headers': response.headers,
        'error': null,
      };
    } else {
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }
}
