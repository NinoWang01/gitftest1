import 'package:flutter/material.dart';

class Page28 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page28State();
  }

}

class _Page28State extends State<Page28>{
  final list = List<Widget>.generate(30, (index)=>Container(margin: EdgeInsets.all(8),padding: EdgeInsets.all(4),child: Text('--$index',style: TextStyle(fontSize: 18),),decoration: BoxDecoration(border: Border.all(width: 1,color:Colors.red ),borderRadius: BorderRadius.circular(10)),));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("wrap--流式布局"),),body: Wrap(children: list.toList()),);
  }

}