import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RaiseQueryService {
  // Login
  Future<bool> ProceedQuery(String name, String room, String regNo, String serialNo, String message)async {
    String url = 'https://hamsystem.000webhostapp.com/raiseQuery.php';
   

    http.Response response;
     Map data = {
      'StudentName': name,
      'RoomNo': room,
      'SerialNo': serialNo,
      'Message': message,
      'regNo': regNo,
    };

    try {
      response = await http.post(Uri.parse(url), body:data,);
      print(response.body);
      
    Map<String, dynamic> values = jsonDecode(response.body);
    if(values["error"])
      {
        print("here");
        return Future.value(false);
      }
    
      else{
        print("here1");
        return Future.value(true);}
    } catch (e) {
      print(e);
    }
  
    return Future.value(true);
  }    

//class LoginResponse{
}
