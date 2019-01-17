import 'package:flutter/material.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

class Page31 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page31State();
  }
}

class _Page31State extends State<Page31> {

  var data = List<String>.generate(50, (index)=>index.toString());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('listview插件'),
        ),
        body:  Refresh(
          onFooterRefresh: onFooterRefresh,
          onHeaderRefresh: onHeaderRefresh,
          childBuilder: (BuildContext context,
              {ScrollController controller, ScrollPhysics physics}) {
            return new Container(
                child: new ListView.builder(
                  physics: physics,
                  controller: controller,
                  itemBuilder: (context,index){
                    return Text('$index');
                  },
                  itemCount: data.length,
                ));
          },
        ));
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        data.addAll(data);
      });
    });
  }


  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        data = data;
      });
    });
  }

}
