import 'package:flutter/material.dart';
import 'package:gitftest1/page14/Page14_1.dart';
import 'package:gitftest1/page14/Page14_2.dart';
import 'package:gitftest1/page14/Page14_3.dart';
import 'package:gitftest1/page14/Page14_4.dart';
import 'package:gitftest1/page14/Page14_5.dart';

class Page14 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page14State();
  }
}

class _Page14State extends State {
  PageController _pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 9,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("MyPage3"),
          elevation: 0.0,
          bottom: page == 0
              ? new PreferredSize(
                  preferredSize:
                      new Size(MediaQuery.of(context).size.width, 40.0),
                  child: new Container(
                    color: Colors.white,
                    height: 40.0,
                    child: new TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.red,
                      indicatorColor: Colors.redAccent,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        new Tab(
                          text: "首页",
                        ),
                        new Tab(
                          text: "男装",
                        ),
                        new Tab(
                          text: "手机",
                        ),
                        new Tab(
                          text: "电器",
                        ),
                        new Tab(
                          text: "鞋包",
                        ),
                        new Tab(
                          text: "百货",
                        ),
                        new Tab(
                          text: "服饰",
                        ),
                        new Tab(
                          text: "电影",
                        ),
                        new Tab(
                          text: "食品",
                        ),
                      ],
                      isScrollable: true,
                    ),
                  ),
                )
              : null,
        ),
        body: new PageView(
          physics: new NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          controller: _pageController,
          children: <Widget>[
            new Page14_1(),
            new Page14_2(),
            new Page14_3(),
            new Page14_4(),
            new Page14_5(),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
            onTap: onTap,
            currentIndex: page,
            type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.home), title: new Text("首页")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.store), title: new Text("新品")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.search), title: new Text("搜索")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.chat), title: new Text("聊天")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.settings_ethernet),
                  title: new Text("个人中心")),
            ]),
      ),
    );
  }
}
