import 'package:flutter/material.dart';
import 'package:gitftest1/page10/Page10.dart';
import 'package:gitftest1/page11/Page11.dart';
import 'package:gitftest1/page12/Page12.dart';
import 'package:gitftest1/page13/Page13.dart';
import 'package:gitftest1/page14/Page14.dart';
import 'package:gitftest1/page15/Page15.dart';
import 'package:gitftest1/page2/Page2.dart';
import 'package:gitftest1/page3/Page3.dart';
import 'package:gitftest1/page4/Page4.dart';
import 'package:gitftest1/page5/Page5.dart';
import 'package:gitftest1/page6/Page6.dart';
import 'package:gitftest1/page7/Page7.dart';
import 'package:gitftest1/page8/Page8.dart';
import 'package:gitftest1/page9/Page9.dart';
import 'page1/Page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          new ListTile(
            title: new Text("listview"),
            subtitle: new Text("三个listview下的方法使用+弹性效果"),
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return Page1();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("listview加载特效"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page2();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("gridview"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page3();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("CustomScrollView"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page4();
              }),);
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("Wedget+listview"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (index){
                return Page5();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("弹窗"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (index){
                return Page6();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("网络请求1"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page7();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("异步"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page8();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("json解析"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page9();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("文本输入"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page10();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("图片"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page11();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("文件存储+sqlite"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page12();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("cupertino导航样式"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page13();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("viewpager"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page14();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("导航路由"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return null;
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("gestures手势"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Page15();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("appbar"),
            onTap: () {},

          ),
          new Divider(),new ListTile(
            title: new Text("SliverAppBar"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("动画"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("画笔"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("自定义动画"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("生命周期"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("时间日期"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("多语言"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("主题配置"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("透明度"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("scrollphysics"),
            onTap: () {},
          ),

          new Divider(),
          new ListTile(
            title: new Text("wrap--流式布局"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件1-Listview"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件2"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件3"),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件4"),
            onTap: () {},
          ),
          new Divider(),
        ],
      ),
    );
  }
}
