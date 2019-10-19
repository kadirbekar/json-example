import 'package:flutter/material.dart';
import "./screens/remote_json.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
    ),
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.home,
              size: 30.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.more_vert,
              size: 30.0,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Remote Json Example",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            height: 55.0,
            child: RaisedButton.icon(
              splashColor: Colors.orange,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RemoteJson()));
              },
              icon: Icon(
                Icons.settings_ethernet,
                color: Colors.black,
              ),
              label: Text(
                "Load Remote Data",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
