import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page6State();
  }
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "弹窗",
      )),
      body:ListView(children: <Widget>[
        RaisedButton(
            child: new Text("tc1"),
            onPressed: (){
             tc1();
        }),
        RaisedButton(
            child: new Text("tc1"),
            onPressed: (){
              tc1();
            }),
        RaisedButton(
            child: new Text("tc2"),
            onPressed: (){
              tc2();
            }),
        RaisedButton(
            child: new Text("tc3"),
            onPressed: (){
              tc3();
            }),
        RaisedButton(
            child: new Text("tc4"),
            onPressed: (){
              tc4();
            }),
        RaisedButton(
            child: new Text("tc5"),
            onPressed: (){
              tc5();
            }),
        RaisedButton(
            child: new Text("tc6"),
            onPressed: (){
              tc6();
            }),
      ],),
    );
  }


  tc1() {}

  tc2() {}

  tc3() {}

  tc4() {}

  tc5() {}

  tc6() {}
}
