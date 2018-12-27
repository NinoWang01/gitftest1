import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page3State();
  }
}

class _Page3State extends State {
  List list = new List();
  ScrollController _controller = new ScrollController();
  bool isShowIndicator = true;

  @override
  void initState() {
    list = List.generate(50, (i) => '哈喽,我是原始数据 $i');
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        Future.delayed(Duration(seconds: 3), () {
          print('refresh');
          setState(() {
            isShowIndicator = false;
            list.addAll(
                List.generate(50, (i) => '哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽,我是新add的 $i'));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("加载效果"),
      ),
      body: getMore1(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  ///默认Android material效果
  Widget getMore1() {
    return RefreshIndicator(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length + 1,
//            itemExtent: 20,
          padding: EdgeInsets.all(0.0),
          itemBuilder: (context, index) {
            return list.length == index
                ? LoadMoreIndicator()
                : ListTile(title: new Text("index ${list[index]}"));
          },
          controller: _controller,
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3), () {
            print('refresh');
            setState(() {
              list =
                  List.generate(50, (i) => '哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽哈喽,我是新刷新的 $i');
            });
          });
        });
  }

  Widget LoadMoreIndicator() {
    isShowIndicator = true;
    return new Center(
      child: new Opacity(
        opacity: isShowIndicator ? 1 : 0,
        child: new Padding(
          padding: EdgeInsets.all(5),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 3,),
              ),

              Padding(child: Text("加载中..."),padding: EdgeInsets.only(left: 5),),
            ],
          ),
        ),
      ),
    );
  }
}
