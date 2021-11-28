import 'package:flutter_application_1/pages/home.page.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter_application_1/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/loginPortal.dart';
import 'package:flutter_application_1/Screens/loginPortal2.dart';
import 'package:flutter_application_1/services/searchService.dart';
import 'Screens/homepage1.dart';

import 'Screens/loginPortal.dart';
import 'Screens/userSearchPage.dart';

AuthService appAuth = new AuthService();
searchService appSearch = new searchService();

void main() async {
  // Set default home.
  Widget _defaultHome = new LoginPage();

  // Run app!
  runApp(new MaterialApp(
    title: 'Hostel Asset Management System',
    home: _defaultHome,
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new searchPage(),
      '/login': (BuildContext context) => new LoginPage(),
      '/itemPage': (BuildContext context) => new HomePage(),
    },
  ));
}
