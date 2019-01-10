import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page19 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page19State();
  }
}

class _Page19State extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Image.asset('assets/lb1.jpeg'),
          Divider(),
          CupertinoButton(
              color: Colors.blue, child: Text("放大"), onPressed: () {

          }),
          Divider(),
          CupertinoButton(
              color: Colors.blue, child: Text("放大"), onPressed: () {

          }),
          Divider(),
          CupertinoButton(
              color: Colors.blue, child: Text("放大"), onPressed: () {

          }),
          Divider(),
          CupertinoButton(
              color: Colors.blue, child: Text("放大"), onPressed: () {

          }),
          Divider(),
          CupertinoButton(
              color: Colors.blue, child: Text("放大"), onPressed: () {

          }),
        ],
      ),
    );
  }
}
