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
      body: ListView(
        children: <Widget>[
          RaisedButton(
              child: new Text("alertDialog"),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return tc1();
                    });
              }),
          RaisedButton(
              child: new Text("SimpleDialog"),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return tc2();
                    });
              }),
          RaisedButton(
              child: new Text("tc3"),
              onPressed: () {
                tc3();
              }),
          RaisedButton(
              child: new Text("tc4"),
              onPressed: () {
                tc4();
              }),
          RaisedButton(
              child: new Text("tc5"),
              onPressed: () {
                tc5();
              }),
          RaisedButton(
              child: new Text("tc6"),
              onPressed: () {
                tc6();
              }),
        ],
      ),
    );
  }

  tc1() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: new Text("Alert Dialog title"),
      content: new Text("Alert Dialog body"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("true"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  tc2() {
    return SimpleDialog(
      title: Text("simpledialog"),
      children: <Widget>[
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  tc3() {}

  tc4() {}

  tc5() {}

  tc6() {}
}
