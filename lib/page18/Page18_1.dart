import 'package:flutter/material.dart';

class Page18_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('newPage'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            color: Colors.green,
            child: Text("返回"),
            onPressed: () {
//        Navigator.of(context).pop(context);
              Navigator.of(context).pop('这个是要返回给上一个页面的数据');
            },
          ),
        ],
      ),
    );
  }
}
