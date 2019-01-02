import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gridview+listview"),
      ),
      body: Page4Content(),
    );
  }

  Widget Page4Content() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1.9),
          delegate: SliverChildListDelegate(List.generate(8, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(
                  height: 1,
                ),
                Icon(Icons.print),
                Text("Grid$index"),
                Divider(
                  height: 1,
                ),
              ],
            );
          })),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(30, (index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text("ListView$index"),
                  ),
                  Divider(height: 1,),
                ],
              );
            }),
          ),
        ),
      ],
    );
//      Column(
//      children: <Widget>[
//        GridView.builder(
//          itemCount: 8,
//          gridDelegate:
//              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//          itemBuilder: (context, index) {
//            return Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Icon(Icons.print),
//                Text("Grid$index"),
//              ],
//            );
//          },
//        ),
////        ListView.builder(
////            itemCount: 30,
////            itemBuilder: (context, index) {
//              return ListTile(
//                title: Text("ListView$index"),
//              );
////            }),
//      ],
//    );
  }
}
