import 'package:flutter_application_1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/contactButton.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = Padding(
        padding: EdgeInsets.only(left: 500.0, right: 500.0),
        child: TextField(
          controller: emailController,
          obscureText: false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));
    final passwordField = Padding(
        padding: EdgeInsets.only(top: 10.0, left: 500.0, right: 500.0),
        child: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));

    final loginButon = Padding(
        padding: EdgeInsets.only(top:10.0, left: 650.0, right: 650.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              appAuth
                  .login(emailController.text, passwordController.text)
                  .then((result) {
                if (result) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  child:
                  Text("Login error (please enter the correct password)");
                }
              });
            },
            child: Text(
              "Login",
              textAlign: TextAlign.center,
            ),
          ),
        ));

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
                "Login Portal",
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
          contactButton(
            bText: 'Contact Us',
            icon: Icon(Icons.send_sharp),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 155.0,
                //   child: Image.asset(
                //     "assets/logo.png",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                //SizedBox(height: 45.0),
                emailField,
                //SizedBox(height: 25.0),
                passwordField,
                // SizedBox(
                //   height: 35.0,
                // ),
                loginButon,
                // SizedBox(
                //   height: 15.0,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
