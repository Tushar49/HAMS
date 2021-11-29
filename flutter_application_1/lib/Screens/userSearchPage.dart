// import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';

import '../main.dart';

class searchPage extends StatelessWidget {
  const searchPage({Key? key}) : super(key: key);
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
                "Welcome to HAMS!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            ),
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

TextEditingController searchController = new TextEditingController();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlue[10],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200.0, left: 50.0),
                      child: TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter the Serial Number',
                          enabledBorder: OutlineInputBorder(
                          borderRadius:const BorderRadius.all(const Radius.circular(10.0))
                        ),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Retry";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1300.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.search),
                      backgroundColor: Colors.deepOrange[900],
                      onPressed: () {
                        appSearch
                            .search(int.parse(searchController.text))
                            .then((result) {
                          if (result) {
                            Navigator.of(context).pushReplacementNamed('/itemPage');
                          }
                        });
                      },
                    ),
                  )
                  // SearchBar(
                  //     hintText: "Enter the Serial Number",
                  //     hintStyle: TextStyle(
                  //       color: Colors.grey[100],
                  //     ))
                  // Opacity(
                  //     opacity: 0.4,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 200.0),
                  //       child: Image.asset('bg.jpeg'),
                  // )),
                  // Text("",
                  //     style: TextStyle(
                  //       fontSize: 20.0,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.bold,
                  //     )),
                ],
              )
            ]),
          ),
        ));
  }
}
