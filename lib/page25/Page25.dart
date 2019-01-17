import 'package:flutter/material.dart';

class Page25 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page25State();
  }

}

class _Page25State extends State<Page25>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text(''),),body:Column(children: <Widget>[
      Container(width: double.infinity,color: Colors.red,child: CircularProgressIndicator(),)

    ],),floatingActionButton: new Theme(
      data: Theme.of(context).copyWith(accentColor: Colors.red),
      child: new FloatingActionButton(
        onPressed: (){
              Navigator.of(context).pop(true);
        },
        child: new Icon(Icons.add),
      ),
    ),);
  }
}