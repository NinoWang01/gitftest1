import 'package:flutter/material.dart';

class Page16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
        leading: Builder(
          //左侧按钮，覆盖了之前默认的返回样式
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
//                Scaffold.of(context).openDrawer();//打开drawer
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,//长按提示
            );
          },
        ), // 左侧返回按钮，可以有按钮，可以有文字
        actions: <Widget>[
          new IconButton(
            // action button
            icon: new Icon(Icons.ac_unit),
            onPressed: () {},
          ),
          new IconButton(
            // action button
            icon: new Icon(
              Icons.ac_unit,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          new FlatButton(onPressed: () {}, child: Text('edit')),
          new PopupMenuButton(
    offset: Offset.lerp(Offset(10, 10),Offset(50, 50),20 ),//位置
              itemBuilder: (BuildContext context) {
            return choices.skip(2).map((Choice choice) {
              return PopupMenuItem<Choice>(
                value: choice,
                child: Text(choice.title),
              );
            }).toList();
          }),

        ],
        iconTheme: IconThemeData(//appbar里图标颜色
            color: Colors.yellow,
            opacity: 0.5,
            size: 30),
        bottom: PreferredSize(
            child: Text('导航栏下边的部分'),
            preferredSize: Size(30, 30)),
        bottomOpacity: 0.5, //底部分的不透明度
        titleSpacing: -10,//标题距离左边的距离
        flexibleSpace: Text('d12321312'), //堆叠在工具栏和标签栏后面。 它的高度与应用栏的整体高度相同。
        elevation: 10, //阴影的高度
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];
