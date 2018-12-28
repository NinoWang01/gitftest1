import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page3();
  }
}

class _Page3 extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gradview"),
      ),
      body: MyGridView5(),
    );
  }

  ///GridView.builder
  MyGridView1() {
    return GridView.builder(
//      scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //数量
            mainAxisSpacing: 50, //每行间距
            crossAxisSpacing: 10, //每列间距
            childAspectRatio: 0.5), //长比宽的值
        itemBuilder: (context, index) {
          return new Container(
            child: Text("哈哈哈"),
            color: Colors.red,
          );
        });
  }

  /// GridView.custom
  MyGridView2() {
    return GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 50, //每行间距
            crossAxisSpacing: 10, //每列间距
            childAspectRatio: 0.5),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            child: Text("222222222222"),
            color: Colors.red,
          );
        }));
  }

  ///GridView.count 根数数量
  MyGridView3() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
          50,
          (index) => Container(
                child: Text("tesxt $index"),
                color: Colors.red,
              )),
    );
  }

  ///GridView.extent 根据像素
  MyGridView4() {
    return GridView.extent(
      //横轴的最大长度
      maxCrossAxisExtent: 115.0,
      padding: const EdgeInsets.all(4.0),
      //主轴间隔
      mainAxisSpacing: 4.0,
      //横轴间隔
      crossAxisSpacing: 4.0,
      childAspectRatio: 2,
      children: List.generate(
          50,
          (index) => Container(
                child: Text("tesxt $index"),
                color: Colors.red,
              )),
    );
  }

  ///GridView
  MyGridView5() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: List.generate(
          50,
          (index) => Container(
                child: Text("tesxt $index"),
                color: Colors.red,
              )),
    );
  }
}
