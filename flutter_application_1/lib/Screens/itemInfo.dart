import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';

import '../main.dart';

class itemInfo extends StatelessWidget {
  const itemInfo({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
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
        Body(),
      ]),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
                  // Opacity(
                  //     opacity: 0.4,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 200.0),
                  //       child: Image.asset('bg.jpeg'),
                  // )),
                  Text("Product Info",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
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
                ],
              )
            ]),
          ),
        ));
  }
}
