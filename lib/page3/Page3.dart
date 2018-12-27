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
      body: MyGridView1(),
    );
  }

  ///GridView.builder
  MyGridView1() {
    return GridView.builder(
//      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return Text("哈哈哈哈");
        });
  }

  /// GridView.custom
  MyGridView2() {
    return GridView.custom(gridDelegate: null, childrenDelegate: null);
  }

  ///GridView.count
  MyGridView3() {
    return GridView.count(crossAxisCount: null);
  }

  ///GridView.extent
  MyGridView4() {
    return GridView.extent(maxCrossAxisExtent: null);
  }

  ///GridView
  MyGridView5() {
    return GridView();
  }
}
