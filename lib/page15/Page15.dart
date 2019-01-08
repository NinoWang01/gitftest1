import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page15 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("手势"),),body: Center(
      child:
      Builder(
        builder: (context) {
          return GestureDetector(
              child: new Text("GestureDetector"),
            onHorizontalDragUpdate:(index){//滑动
                print('------$index');
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("onHorizontalDragUpdate-$index")));

    },
              onTap: () {
               Scaffold.of(context).showSnackBar(SnackBar(content: Text("ontap")));},);
              },
          ),

    ));
  }

}