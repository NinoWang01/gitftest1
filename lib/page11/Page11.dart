import 'dart:io';

import 'package:flutter/material.dart';

class Page11 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("图片"),
      ),
      body: Center(child: ListView(children: <Widget>[
        Text("网络图片"),
        Image.network("https://gss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/9345d688d43f87947f2e9592df1b0ef41ad53abd.jpg"),
        Divider(),
        Text("本地项目图片1"),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child:  Image.asset('assets/rick.jpeg'),),

        Divider(),
          Text("本地项目图片2"),
          Image(image: AssetImage('assets/rick.jpeg'),),
          Divider(),
        Text("本地路径图片"),
        Image.file(File("/storage/emulated/0/aaa.jpg")),
        Divider(),
        Text("icon图片"),
        Icon(Icons.ac_unit,color: Colors.red,),
        Divider(),
      ],),),
    );
  }
}
