import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';
import 'package:flutter_application_1/services/raiseQueryService.dart';

import '../main.dart';

TextEditingController queryNameController = new TextEditingController();
TextEditingController queryRegNoController = new TextEditingController();
TextEditingController queryRoomNoController = new TextEditingController();
TextEditingController querySerialNoController = new TextEditingController();
TextEditingController queryMsgController = new TextEditingController();

class raiseQuery extends StatelessWidget {
  const raiseQuery({Key? key}) : super(key: key);
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
                "Query Form",
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
        color: Colors.lightBlue[10],
        child: Center(
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 300.0, right: 300.0),
                  child: TextFormField(
                      controller: queryNameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                        labelText: 'Enter your Name',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Retry";
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 440.0, left: 300.0, right: 300.0),
                  child: TextFormField(
                      controller: queryMsgController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                        hintText: 'Enter your Query/Complaint',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Retry";
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 330.0, left: 300.0, right: 300.0),
                  child: TextFormField(
                      controller: querySerialNoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                        hintText: 'Enter the Serial Number',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Retry";
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 110.0, left: 300.0, right: 300.0),
                  child: TextFormField(
                      controller: queryRegNoController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                        labelText: 'Enter your Registration Number',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Retry";
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 220.0, left: 300.0, right: 300.0),
                  child: TextFormField(
                      controller: queryRoomNoController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                        labelText: 'Enter your Room Number (For example- G11)',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Retry";
                        }
                        return null;
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 600.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.event_note_rounded),
                      backgroundColor: Colors.deepOrange[900],
                      onPressed: () {
                        print("query - "+  queryRegNoController.text + " " + querySerialNoController.text);
                        appRaise
                            .ProceedQuery(queryNameController.text, queryRoomNoController.text, queryRegNoController.text,
                            querySerialNoController.text, queryMsgController.text)
                            .then((result) {
                          if (result==true) {
                            Navigator.of(context).pushReplacementNamed('/thankYou');
                          }
                        });
                      },
                    ),
                  )
              ],
            )
          ]),
        ));
  }
}
