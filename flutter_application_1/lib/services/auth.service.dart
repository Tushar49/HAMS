import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // Login
  Future<bool> login(String email, String password)async {
    String url = 'https://hamsystem.000webhostapp.com/login.php';
    print(url);
  

    print(email);
    print(password);

    http.Response response;
     Map data = {
      'username': email,
      'password': password
    };

    try {
      response = await http.post(Uri.parse(url), body:data,);
      print(response.body);
      if (response.statusCode != 200) {
        return Future.value(false);
    }
    } catch (e) {
      print(e);
    }
  
    return Future.value(true);
  }    
  

  // Logout
  Future<void> logout() async {
    // Simulate a future for response after 1 second.
    return await new Future<void>.delayed(
      new Duration(
        seconds: 1
      )
    );
  }
}