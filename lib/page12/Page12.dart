import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page12State();
  }
}

class Page12State extends State<Page12> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("文件存储+sqlite"),
        ),
        body: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            children: <Widget>[
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
              new Divider(),
              CupertinoButton(
                color: Colors.blue,
                child: Text("文件存储"),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
