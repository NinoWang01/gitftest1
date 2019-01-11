import 'package:flutter/material.dart';

class Page20 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page20State();
  }
}

class _Page20State extends State {
  List<Widget> list = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("画笔"),
      ),
      body: ListView(
        children: list.toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("add"),
          onPressed: () {
            setState(() {
              list.add(Text('111111'));
            });
          }),
    );
  }
}
