import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';

import '../main.dart';

class thankYouPage extends StatelessWidget {
  const thankYouPage({Key? key}) : super(key: key);
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
              child: TextButton(
                child: Text("Go Back",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
            )
          ],
        ),
        actions: [
          contactButton(
            bText: 'Contact Us',
            icon: Icon(Icons.send_sharp),
            onPressed: () {},
          )
        ],
      ),
      body: 
      Stack(children: [
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
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("TYBG.jpg"), fit: BoxFit.fill)),
          child: TextField(
            decoration: InputDecoration(fillColor: Colors.amber, filled: true),
          ));
  }
}
