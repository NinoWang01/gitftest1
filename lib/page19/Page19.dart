import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gitftest1/page19/Page19_2.dart';
import 'package:gitftest1/page19/Page19_3.dart';

class Page19 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page19State();
  }
}

class _Page19State extends State with SingleTickerProviderStateMixin {
  Animation<double> doubleAnimation;
  AnimationController animationController;
  var showData = '数字增加';

  Animation<double> aAnimation;
  CurvedAnimation curve; //非线性播放，比如先快后慢
  AnimationController aController;
  var showData2 = '数字增加';

  @override
  void initState() {
//    --1--
//    animationController =
//        AnimationController(vsync: this, duration: Duration(seconds: 2));
//
//    doubleAnimation = Tween(begin: 0.0, end: 100.0).animate(animationController)
//      ..addListener(() {
//        setState(() {
//          //监听动画值的改变
//          showData = doubleAnimation.value.toString();
//        });
//      })
//      ..addStatusListener((status) {
//        if (status == AnimationStatus.forward) {
//          print("动画开始");
//        } else if (status == AnimationStatus.completed) {
//          print("动画结束");
//          animationController.reverse();//反转动画
//        } else if (status == AnimationStatus.dismissed) {
//          print("动画消失");
//          animationController.forward();//从新开始动画
//        }
//      });

//    --2--
    aController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    curve = new CurvedAnimation(parent: aController, curve: Curves.bounceInOut);
    aAnimation = new Tween(begin: 0.0, end: 500.0).animate(curve)
      ..addListener(() {
        setState(() {
          //监听动画值的改变
          showData2 = aAnimation.value.toString();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Image.asset(
            'assets/lb1.jpeg',
            height: aAnimation.value,
            width: aAnimation.value,
          ),
          Divider(),
          CupertinoButton(
              color: Colors.blue,
              child: Text(showData + "+控制View的大小"),
              onPressed: () {
                animationController.forward(from: 0); //开始动画
              }),
          Divider(),
          CupertinoButton(
//             padding: EdgeInsets.only(left:aAnimation.value ),
              color: Colors.blue,
              child: Text("$showData2+非线性速度"),
              onPressed: () {
                aController.forward(from: 0);
              }),
          Divider(),
          CupertinoButton(
              color: Colors.blue,
              child: Text("多个动画效果"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Page19_2();
                }));
              }),
          Divider(),
          Hero(
            tag: 'hero',
            child: CupertinoButton(
                color: Colors.blue,
                child: Text("hero"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Page19_3();
                  }));
                }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    aController.dispose();
  }
}
