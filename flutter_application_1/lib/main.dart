// import 'package:flutter_application_1/widgets/query.dart';
// import 'Screens/homepage1.dart';
// import 'package:flutter_application_1/pages/home.page.dart';
// import 'Screens/loginPortal.dart';
// import 'package:flutter_application_1/Screens/loginPortal.dart';
// import 'package:flutter_application_1/Screens/loginPortal2.dart';
import 'package:flutter_application_1/Screens/itemInfo.dart';
import 'package:flutter_application_1/Screens/raiseQuery.dart';
import 'package:flutter_application_1/Screens/thankYou.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter_application_1/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/raiseQueryService.dart';
import 'package:flutter_application_1/services/searchService.dart';
import 'Screens/userSearchPage.dart';

AuthService appAuth = new AuthService();
searchService appSearch = new searchService();
RaiseQueryService appRaise=  new RaiseQueryService();

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
      '/itemPage': (BuildContext context) => new ItemInfo(),
      '/raiseQuery': (BuildContext context) => new raiseQuery(),
      '/thankYou': (BuildContext context) => new thankYouPage(),
    },
  ));
}
