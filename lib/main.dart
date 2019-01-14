import 'package:flutter/material.dart';
import 'package:gitftest1/page10/Page10.dart';
import 'package:gitftest1/page11/Page11.dart';
import 'package:gitftest1/page12/Page12.dart';
import 'package:gitftest1/page13/Page13.dart';
import 'package:gitftest1/page14/Page14.dart';
import 'package:gitftest1/page15/Page15.dart';
import 'package:gitftest1/page16/Page16.dart';
import 'package:gitftest1/page17/Page17.dart';
import 'package:gitftest1/page18/Page18.dart';
import 'package:gitftest1/page18/Page18_1.dart';
import 'package:gitftest1/page19/Page19.dart';
import 'package:gitftest1/page2/Page2.dart';
import 'package:gitftest1/page20/Page20.dart';
import 'package:gitftest1/page21/Page21.dart';
import 'package:gitftest1/page22/Page22.dart';
import 'package:gitftest1/page23/Page23.dart';
import 'package:gitftest1/page24/Page24.dart';
import 'package:gitftest1/page25/Page25.dart';
import 'package:gitftest1/page26/Page26.dart';
import 'package:gitftest1/page27/Page27.dart';
import 'package:gitftest1/page28/Page28.dart';
import 'package:gitftest1/page29/Page29.dart';
import 'package:gitftest1/page3/Page3.dart';
import 'package:gitftest1/page30/Page30.dart';
import 'package:gitftest1/page31/Page31.dart';
import 'package:gitftest1/page32/Page32.dart';
import 'package:gitftest1/page33/Page33.dart';
import 'package:gitftest1/page34/Page34.dart';
import 'package:gitftest1/page4/Page4.dart';
import 'package:gitftest1/page5/Page5.dart';
import 'package:gitftest1/page6/Page6.dart';
import 'package:gitftest1/page7/Page7.dart';
import 'package:gitftest1/page8/Page8.dart';
import 'package:gitftest1/page9/Page9.dart';
import 'page1/Page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}
bool changethemeStyle = false;

class _MyApp extends State{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Demo',
      theme: changethemeStyle?ThemeData(
        primarySwatch: Colors.green,
      ):
      ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        // 这里可以定义静态路由，不能传递参数
        '/route/Page18_1': (_) => new Page18_1(), //路径可以随便起
      },
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page3();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("CustomScrollView"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Page4();
                }),
              );
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("Wedget+listview"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (index) {
                return Page5();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("弹窗"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (index) {
                return Page6();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("网络请求1"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page7();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("异步"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page8();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("json解析"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page9();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("文本输入"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page10();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("图片"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page11();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("文件存储+sqlite"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page12();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("cupertino导航样式"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page13();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("viewpager"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page14();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("gestures手势"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page15();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("appbar"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page16();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("SliverAppBar"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page17();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("路由导航和数据传递"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page18();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("动画"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page19();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("画笔"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page20();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("底部嵌入"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page21();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("生命周期"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page22();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("时间日期"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page23();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("多语言"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page24();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("主题配置"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page25();
              })).then((val){
                 setState(() {
//                   Theme.of(context).(primaryColor: Colors.red);
                   Theme.of(context).copyWith(accentColor: Colors.red);
                   changethemeStyle = !changethemeStyle;
                 });
              });
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("透明度"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page26();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("自定义ScrollPhysics"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page27();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("wrap--流式布局"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page28();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("调用Android控件"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page29();
              }));
            },
          ),
          new Divider(),

          new ListTile(
            title: new Text("圆形头像和图片缓存"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page30();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件1-Listview"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page31();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件2-视频播放"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page32();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件3"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page33();
              }));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("插件4"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Page34();
              }));
            },
          ),
          new Divider(),
        ],
      ),
    );
  }
}
