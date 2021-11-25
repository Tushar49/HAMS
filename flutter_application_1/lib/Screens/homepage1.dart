import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';

class TRIAL extends StatelessWidget {
  const TRIAL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage('https://picsum.photos/200'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hulery",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
        actions: [
          contactButton(
            bText: 'Contact Me',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
              color: Colors.black,
              child: Column(children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                        opacity: 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 200.0),
                          child: Image.asset('bg.jpeg'),
                        )),
                    Text("I\'m Tushy\nA Guy in Black",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )
              ])),
        ),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
            ))
      ],
    );
  }
}
