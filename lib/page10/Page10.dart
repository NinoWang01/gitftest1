import 'package:flutter/material.dart';

class Page10 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("文本输入"),),body: ListView(padding:EdgeInsets.all(5),children: <Widget>[
      wb1(),
      Divider(),
      wb2(),
      Divider(),
      wb3(),
      Divider(),
      wb4(),
      Divider(),
    ],));
  }

  wb1() {
    return TextField();
  }

  wb2() {
    return TextField(
      obscureText: true,//密码
      decoration:
      InputDecoration(fillColor: Colors.blue.shade100, filled: true, labelText: 'Hello',   prefixIcon: Icon(Icons.local_airport),
          suffixText: 'airport',
        helperText: 'help',),
    );
  }
  wb3(){
    return Theme(
      data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
            )),
      ),
    );


  }

  wb4() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      height: 60.0,
      decoration: new BoxDecoration(
          color: Colors.blueGrey,
          border: new Border.all(color: Colors.black54, width: 4.0),
          borderRadius: new BorderRadius.circular(12.0)),
      child: new TextFormField(
        decoration: InputDecoration.collapsed(hintText: 'hello'),
      ),
    );
  }
}