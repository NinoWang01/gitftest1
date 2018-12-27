import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      body: MyListView1(),
    );
  }

  /// listview.builder

  Widget MyListView1() {
    return new ListView.builder(
        //scrollDirection:Axis.horizontal,//滑动方向
        physics:BouncingScrollPhysics(),
       // itemCount: 20, //item数量，不写默认无限
        padding: EdgeInsets.all(8.0),
        addAutomaticKeepAlives: true,//使项目保持活动状态，否则会被破坏,默认是true
        itemExtent: 20.0, //item间的距离
        itemBuilder: (context, index) {
          return Text('item $index');
        });
  }

  /// listview.custom
  Widget MyListView2() {
    return new ListView.custom(
//      physics:NeverScrollableScrollPhysics(),//控制滚动的发生方式,取消滑动
      physics:BouncingScrollPhysics(),//弹回列表,ios风格
//      physics:ClampingScrollPhysics(),//边缘动画，Android风格
//      physics:FixedExtentScrollPhysics(),//仅适用于FixedExtendScrollControllers和使用它们的列表

      itemExtent: 20.0,
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return new Text("index $index");
        },
        childCount: 50,
      ),
    );
  }

  /// listview.separated
  /// 可以在不影响原列表的情况下，设置分割符列表，可以每条插入，也可以n条原列表数据后插入（广告）
  /// itemcount是必须值
  /// 分隔符列表长度比项目列表小 1，因为在最后一个元素之后不存在分隔符。
  Widget MyListView3() {
    return new ListView.separated(
        itemBuilder: (context, index) {
          return new Text("index $index");
        },
        separatorBuilder: ((context, index) {
          if ((index + 1) % 5 == 0) {
            //每5行显示一个
            return new Text("广告/定制分割线 $index");
          } else {
            return Container();
          }
        }),
        itemCount: 30);
  }
}

class MyChildrenDelegate extends SliverChildBuilderDelegate {
  MyChildrenDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive = true,
    bool addRepaintBoundaries = true,
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
  }

  ///可不重写 重写不能为null  默认是true  添加进来的实例与之前的实例是否相同 相同返回true 反之false
  ///listView 暂时没有看到应用场景 源码中使用在 SliverFillViewport 中
  @override
  bool shouldRebuild(SliverChildBuilderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    print("oldDelegate$oldDelegate");
    return super.shouldRebuild(oldDelegate);
  }
}
