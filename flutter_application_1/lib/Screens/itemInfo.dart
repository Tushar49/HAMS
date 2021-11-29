import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';

import 'package:flutter_application_1/model/items.dart';
import '../main.dart';

class ItemInfo extends StatelessWidget {

  // static const String route = '/itemPage';

  // final Items args;

  ItemInfo();

  Widget build(BuildContext context) {
    final Items args = ModalRoute.of(context)!.settings.arguments as Items;
    print("args here - " + args.toString());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange[900],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage(
                    'https://media.istockphoto.com/vectors/hostel-building-flat-illustration-vector-id519665036'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Product Information",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
        actions: [
          new FlatButton(
              child: new Text('Logout'),
              onPressed: () {
                appAuth.logout().then((_) =>
                    Navigator.of(context).pushReplacementNamed('/login'));
              }),
          contactButton(
            bText: 'Contact Us',
            icon: Icon(Icons.send_sharp),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(children: [
        Body(args),
      ])
      ,
    );
  }
}

class Body extends StatelessWidget {
  final Items args;
  Body(this.args);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue[100],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Product Information of item\n",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),

              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Serial Number - " + args.serial_number, 
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                      
                
                ],
              ),

              Stack(
                alignment: Alignment.center,
                children: [
                  Text("Type - " + args.type, 
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                      
                  
                ],
                
              ),
              Padding(
                      padding: const EdgeInsets.only(top: 158.0),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Colors.black12,
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                        label: Text('Raise A Query'),
                        onPressed: () {
                          appAuth.logout().then((_) => Navigator.of(context)
                              .pushReplacementNamed('/raiseQuery'));
                        },
                        icon: Icon(Icons.add_comment_outlined),
                      ))


             

              
            ]),
          ),
        ));
  }
}
