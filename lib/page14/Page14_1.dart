import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class Page14_1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

class _Page1 extends State {
  final PageController controller = PageController(initialPage: 300);
  int _doc = 0;
  static const platform = const MethodChannel("com.example.test4/android");

  showToast(String msg) async {
    try {
      await platform.invokeMethod("showToast", {"msg": msg});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    new Timer.periodic(new Duration(seconds: 5), (Timer timer) {
      onAutoScroll();
    });
  }

  void onAutoScroll() {
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarView(children: [
      new Container(
        child: new SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: new Column(
            children: <Widget>[
              new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new Container(
                    height: 130.0,
                    width: MediaQuery.of(context).size.width,
                    child: new PageView.builder(
                        onPageChanged: (int index) {
                          setState(() {
                            _doc = controller.page.round() % 3;
                          });
                        },
                        controller: controller,
                        itemBuilder: (context, index) {
                          String photoPath = "assets/lb1.jpeg";
                          switch (index % 3) {
                            case 0:
                              photoPath = 'assets/lb1.jpeg';
                              break;
                            case 1:
                              photoPath = 'assets/lb2.jpeg';
                              break;
                            case 2:
                              photoPath = 'assets/lb3.jpeg';
                              break;
                          }
                          return new GestureDetector(
                            onTap: () {
                              showToast("$photoPath");
                            },
                            child: new Image(
                              width: MediaQuery.of(context).size.width,
                              image: new AssetImage(photoPath),
                            ),
                          );
                        }),
                  ),
                  Doc(),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  iconAndText('assets/icon1.png', "限时秒杀"),
                  iconAndText('assets/icon2.png', '品牌清仓'),
                  iconAndText('assets/icon3.png', '名品折扣'),
                  iconAndText('assets/icon4.png', '海淘'),
                  iconAndText('assets/icon5.png', '助理享免单'),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  iconAndText('assets/icon6.png', '爱逛街'),
                  iconAndText('assets/icon7.png', '9块9特卖'),
                  iconAndText('assets/icon8.png', '新人礼包'),
                  iconAndText('assets/icon9.png', '美食汇'),
                  iconAndText('assets/icon10.png', '好友红包'),
                ],
              ),
              new Container(
                color: Colors.grey[200],
                margin: const EdgeInsets.only(top: 10.0),
                width: MediaQuery.of(context).size.width,
                height: 12.0,
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return new Scaffold(
                          backgroundColor: Colors.black,
                          body: new Center(
                            child: new Hero(
                              tag: 'Hero',
                              child: new GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Image.network(
                                  "http://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2017/07/20/20170720-033010_U7356_M303329_731d.jpg?itok=3p_aB4T5",
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                child: new Hero(
                  tag: 'Hero',
                  child: new Image.network(
                    "http://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2017/07/20/20170720-033010_U7356_M303329_731d.jpg?itok=3p_aB4T5",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      new Text("22222"),
      new Text("33333"),
      new Text("44444"),
      new Text("55555"),
      new Text("66666"),
      new Text("77777"),
      new Text("88888"),
      new Text("99999"),
    ]);
  }

  Widget iconAndText(icon, text) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Scaffold.of(context)
                  .showSnackBar(new SnackBar(content: new Text("$text")));
            },
            child: new Container(
              margin: const EdgeInsets.only(top: 8.0, bottom: 5.0),
              child: new Image(
                width: 34.0,
                height: 34.0,
                image: new AssetImage(icon),
              ),
            ),
          ),
          new Text(text),
        ],
      ),
    );
  }

  Widget Doc() {
    return new Container(
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width,
      height: 18.0,
      color: const Color(0xaaD6D6D6),
      padding: const EdgeInsets.only(right: 24.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new CircleAvatar(
            radius: 4.0,
            backgroundColor: _doc == 0 ? Colors.red : Colors.grey,
          ),
          new Container(
            width: 3.0,
          ),
          new CircleAvatar(
            radius: 4.0,
            backgroundColor: _doc == 1 ? Colors.red : Colors.grey,
          ),
          new Container(
            width: 3.0,
          ),
          new CircleAvatar(
            radius: 4.0,
            backgroundColor: _doc == 2 ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}
