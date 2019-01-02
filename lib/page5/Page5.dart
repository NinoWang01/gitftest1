import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("widget+listview"),), body: _page5(),);
  }

  _page5() {
    return ListView.builder(
        itemCount: 50 + 1,
        itemBuilder: (context, index) {
          return index == 0 ? MyHeadWidget() : ListTile(
              title: Text("Listtile${index - 1}",));
        });
  }

  //自定义一块头部
  MyHeadWidget() {
    return Column(
      children: <Widget>[
        Text("22222222222222222222"),
        Text("22222222222222222222"),
        Text("22222222222222222222"),
        Text("22222222222222222222"),
        Text("22222222222222222222"),
        Text("22222222222222222222"),
      ],
    );
  }
}