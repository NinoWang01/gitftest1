import 'dart:ui';

import 'package:flutter/material.dart';

class Page26 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page26State();
  }
}

class _Page26State extends State<Page26> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('透明度'),
      ),
      body: Stack(
        children: <Widget>[
          Center(child: Image.asset("assets/rick.jpeg"),),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY:2.0),
            child: new Container(
              padding: const EdgeInsets.all(30.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:
              new BoxDecoration(color: Colors.red.withOpacity(0.6)),
              child: new Center(
                child: new Text('Test'),//被图片覆盖

              ),
            ),
          ),


        ],
      ),
    );
  }
}
