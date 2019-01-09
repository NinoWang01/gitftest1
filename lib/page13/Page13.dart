import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page13 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page13State();
  }
}

class _Page13State extends State {
  final Map<int, Widget> map = const <int, Widget>{
    0: Text('Midnight'),
    1: Text('Viridian'),
    2: Text('Cerulean'),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text('Title'),
      ),
      child: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.help), title: new Text("aaaaaa")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.help), title: new Text("bbbbbbb")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.help), title: new Text("cccccc")),
        ]),
        tabBuilder: (BuildContext context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: new CupertinoTabView(
              builder: (BuildContext context2) {
                switch (index) {
                  case 0:
                    return new Center(
                      child: new CupertinoButton(
                        child: const Text('Next page'),
                        onPressed: () {
                          Navigator.of(context).push(
                            new CupertinoPageRoute<Null>(
                              builder: (BuildContext context) {
                                return new CupertinoPageScaffold(
                                  navigationBar: new CupertinoNavigationBar(
                                    middle: new Text('Page 2 of tab $index'),
                                  ),
                                  child: new Center(
                                    child: new CupertinoButton(
                                      color: Colors.red,
                                      child: const Text('Back'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                    break;
                  case 1:
                    return CupertinoSegmentedControl(
                      children: map,
                      onValueChanged: (int newValue) {
                        setState(() {
//                          sharedValue = newValue;
                        });
                      },
                    );
                    break;
                  case 2:
                    return new Center(
                      child: Text("2333"),
                    );
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
    );
  }
}
