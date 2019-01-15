import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page29 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page29State();
  }
}

class _Page29State extends State<Page29> {
  static const platform = const MethodChannel("com.example.gitftest/android");
  static const EventChannel eventChannel =
  const EventChannel('com.example.gitftest/netChanged');

  var netChangeStr = "点我获取当前网络状态";
  var date = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('调用Android原声控件'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          MaterialButton(
              child: Text('原生控件toast'+date),
              color: Colors.blue,
              onPressed: () {
                showToast("这是toast内容");

                getAndroidTime().then((str){
                  setState(() {
                    date = str;
                  });
                });


              }),
          MaterialButton(
              child: Text('广播监控'),
              color: Colors.blue,
              onPressed: (){
            isNetConnection().then((bool) {
              showToast(bool ? "网络连接成功" : "网络连接失败");
            });
          }),
        ],),
      ),
    );
  }

  showToast(String msg) async {
    try {
      await platform.invokeMethod("showToast",{"msg":msg});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  Future<String> getAndroidTime() async {
    var str;
    try {
      str = await platform.invokeMethod("getAndroidTime");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return str;
  }

  @override
  void initState() {
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }
  void _onEvent(Object event) {
    setState(() {
      netChangeStr = event;
    });
  }

  void _onError(Object error) {
    setState(() {
      netChangeStr = "网络状态获取失败";
    });
  }

  Future<bool> isNetConnection() async {
    bool isConnection;
    try {
      isConnection = await platform.invokeMethod("netConnection");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return isConnection;
  }



}



