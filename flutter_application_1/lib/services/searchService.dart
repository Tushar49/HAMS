import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/search.dart';
import 'package:http/http.dart' as http;

class searchService {
  // Search
  Future<bool> search(int serialCode)async {
    String url = 'https://hamsystem.000webhostapp.com/productSearch.php';
    print(url);
  
    print(serialCode);

    http.Response response;
     Map data = {
      'SerialNumber': serialCode,
    };

    try {
      response = await http.post(Uri.parse(url), body:data,);
      print(jsonDecode(response.body));
      if (response.statusCode != 200) {
        return Future.value(false);
    }
    } catch (e) {
      print(e);
    }
    return Future.value(true);
  }    
}