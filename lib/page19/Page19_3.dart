import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page19_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('hero'),
      ),
      body: Hero(
        tag: 'hero',
        child: CupertinoButton(
            color: Colors.blue,
            child: Text("hero"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                Navigator.of(context).pop();
              }));
            }),
      ),
    );
  }
}
