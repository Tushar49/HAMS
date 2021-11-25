import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ftpconnect/ftpconnect.dart';
import 'package:ftpclient/ftpclient.dart';

//import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Server',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Server App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required final this.title}) : super(key: key);
  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

class _MyHomePageState extends State<MyHomePage> {
  Future textData = Future.value();

  @override
  void initState() {
    super.initState();
    textData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: textData,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            List<Items> snap = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Unable to fetch data due to error in connection"),
              );
            }
            print(snap.length);
            return ListView.builder(itemCount: snap.length, itemBuilder: _buildItemsForListView);
          }),
    );
  }

  // Future<String> getData() async {
  //   print("hello");
  //   var url = 'ftp://hamsid:3Ju4ODGT2VQRhGrmEA&r@files.000webhost.com/get.php';
  //   print(url);
  //   final Uri urls = Uri.parse(url);
  //   FTPConnect ftp_Client = FTPConnect('ftp://files.000webhost.com/public_html/',
  //   port: 21, user: 'hamsid', pass: '3Ju4ODGT2VQRhGrmEA&r', debug: true);

  //   print(ftp_Client);
  //   print(ftp_Client.listDirectoryContent);

  //   String fileName = 'get.php';
  //   print('filename');
  //   ftp_Client.connect();
  //   print('connection done');
  //   ftp_Client.downloadFile(fileName, File('abc.php'));
  //   print('here after download');

  //   // bool response = ftp_Client.downloadFile(fileName, File('abc.php'));

  //   // print(response);
  //   // var data = jsonDecode(response.body);
  //   // print(data.toString());

  //   // bool res = await ftpConnect.downloadFile(fileName, File('abc.php'));
  //   ftp_Client.disconnect();
  //   //print(Future.File('abc.php'))
  //   return 'FutureReturned';
  // }
  // Future<String> getData() async {
  //   print("hello");
  //   var url = 'ftp://hamsid:3Ju4ODGT2VQRhGrmEA&r@files.000webhost.com/get.php';
  //   print(url);
  //   final Uri urls = Uri.parse(url);
  //   FTPClient ftp_Client = FTPClient('ftp://files.000webhost.com', port: 21, user: 'hamsid', pass: '3Ju4ODGT2VQRhGrmEA&r', debug: true);

  //   print(ftp_Client);
  //   print(ftp_Client.listDirectoryContent);

  //   String fileName = 'get.php';
  //   print('filename');
  //   ftp_Client.connect();
  //   print('connection done');
  //   ftp_Client.downloadFile(fileName, File('abc.php'));
  //   print('here after download');

  //   // bool res = await ftpConnect.downloadFile(fileName, File('abc.php'));
  //   ftp_Client.disconnect();
  //   //print(Future.File('abc.php'))
  //   return 'FutureReturned';
  // }
}

// Future getData() async {
//   print("hello");
//   String url = 'https://hamsid.000webhostapp.com/getData.php';

//   await Future.delayed(const Duration(seconds: 10), () {});

//   // print(http.get(Uri.parse(url), headers: {
//   //   'Access-Control-Allow-Origin': '*'
//   // }));
//   print(url);
//   // print(Uri.encodeFull(url));
//   // print(Uri.parse(Uri.encodeFull(url)));
//   // print(Uri.http('hamsid.000webhostapp.com', '/getData.php'));
//   // print(Uri.https('hamsid.000webhostapp.com', '/getData.php'));

//   // final Uri urls = Uri.parse(url);
//   final response = await http.read(Uri.parse(url), headers: {
//     'Access-Control-Allow-Origin': '*'
//   });
//   print("HELLO!");
//   // var response = await http.get(Uri.encodeFull(url), headers: {
//   //   "Accept": "application/json"
//   // });
//   print(response);
//   var data = jsonDecode(response);
//   print(data);
//   return data;
// }
// // }

//Preeti's version
List<Items> items = [];

Future getData() async {
  String url = 'https://hamsid.000webhostapp.com/getData_3.php';
  print(url);
  //http.Response response;
  http.Response response;
  try {
    response = await http.get(Uri.parse(url));
    print(response.contentLength);
    Iterable l = json.decode(response.body);
    items = List<Items>.from(l.map((model) => Items.fromJson(model)));
  } catch (e) {
    print(e);
  }
  print(items);
  return items;
}

class Items {
  final int ITEM_CODE;
  final int TYPE;
  final int ROOM;
  final String LAST_SERVICE_DATE;

  Items({required this.ITEM_CODE, required this.TYPE, required this.ROOM, required this.LAST_SERVICE_DATE});

  factory Items.fromJson(Map<String, dynamic> json) {
    Items item = new Items(ITEM_CODE: json['ITEM_CODE'], TYPE: json['TYPE'], ROOM: json['ROOM'], LAST_SERVICE_DATE: json['last_srv_date']);
    return item;
  }
}

ListTile _buildItemsForListView(BuildContext context, int index) {
  return ListTile(
    title: Text(items[index].ITEM_CODE.toString()),
    subtitle: Text(items[index].TYPE.toString(), style: TextStyle(fontSize: 18)),
  );
}
