import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/search.dart';
import 'package:flutter_application_1/model/items.dart';
import 'package:http/http.dart' as http;

class searchService {
  // Search
  Future<Items> search(int serialCode)async {
    String url = 'https://hamsystem.000webhostapp.com/productSearch.php';
    print(url);
  
    print(serialCode);

    http.Response response;
     Map<String, String> data = {
      'SerialNumber': serialCode.toString(),
    };
    try {
      response = await http.post(Uri.parse(url), body:data,);
      Map<String, dynamic> values = jsonDecode(response.body);
      print(values);
      print(values['Serial Number']);
      print(values['Type']);
      print(values['Last Service Date']);
      print(values['Block']);
      print(values['Room Number']);

   var it = Items(
    values['Serial Number'], 
    values['Type'], 
    values['Last Service Date'], 
    values['Block'], 
    values['Room Number']);

    return Future.value(it);
    } catch (e) {
      print(e);
    }
    return Future.value();
  }    
}