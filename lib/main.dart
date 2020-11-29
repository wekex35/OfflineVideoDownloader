import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'components/download_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void dialog(){
    print( Directory.current.path);
        showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DownloadAlert(
        url: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8",
        path: Directory.current.path+"/test.mp4",
      ),
    ).then((v) { 
      // When the download finishes, we then add the book
      // to our local database
      print("Downloaded");
    });
  }
  Future<void> path() async {
    var path = await getApplicationDocumentsDirectory();
    print(path);
  }
 @override
  void initState() {
    path();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(
        child : RaisedButton(onPressed: () => dialog(),
        child: Text("Text Download"),
        )
      ),),
    );
  }
}
