import 'package:flutter/material.dart';
import 'package:gitftest1/page18/Page18_1.dart';

class Page18 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _page18State();
  }
}

class _page18State extends State {
  var fhz = "返回值";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('路由和数据传递'),
      ),
      body: ListView(
        children: <Widget>[
          //在Main的MaterialApp里注册Page18_1
          RaisedButton(
            color: Colors.red,
            child: Text("路由1-静态路由"),
            onPressed: () {
              Navigator.of(context).pushNamed('/route/Page18_1').then((val) {
                setState(() {
                  fhz = val;
                });
              });
            },
          ),
          //动态路由可以根据页面状态传值
          RaisedButton(
            color: Colors.red,
            child: Text("路由2-动态路由"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (contxt) {
                return Page18_1();
              })).then((val) {
                setState(() {
                  fhz = val;
                });
              });
            },
          ),

          RaisedButton(
            color: Colors.red,
            child: Text("路由3-平移动画"),
            onPressed: () {
              Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                return new Page18_1();
              }, transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                // 添加一个平移动画
                return createTransition(animation, child);
              }));
            },
          ),

          Center(
            child: Text(fhz),
          ),
        ],
      ),
    );
  }

  /// 创建一个平移变换
  /// 跳转过去查看源代码，可以看到有各种各样定义好的变换
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}
