import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page6State();
  }
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "弹窗",
      )),
      body: ListView(
        children: <Widget>[
          RaisedButton(
              child: new Text("alertDialog"),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return tc1();
                    });
              }),
          RaisedButton(
              child: new Text("SimpleDialog"),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return tc2();
                    });
              }),
          RaisedButton(
              child: new Text("底部弹窗"),
              onPressed: () {
//                return showBottomSheet(context: context, builder: (context) {
                tc3();
//                });
              }),
          Builder(
            builder: (context) {
              return RaisedButton(
                  child: new Text("snackbar"),
                  onPressed: () {
                    tc4(context);
                  });
            },
          ),
          RaisedButton(
              child: new Text("cupertino底部弹窗"),
              onPressed: () {
                tc5();
              }),
          RaisedButton(
              child: new Text("CupertinoActionSheet"),
              onPressed: () {
                tc6();
              }),
          RaisedButton(
              child: new Text("CupertinoAlertDialog"),
              onPressed: () {
                tc7();
              }),
          RaisedButton(
              child: new Text("CupertinoDialog"),
              onPressed: () {
                tc8();
              }),
        ],
      ),
    );
  }

  tc1() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: new Text("Alert Dialog title"),
      content: new Text("Alert Dialog body"),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("true"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  tc2() {
    return SimpleDialog(
      title: Text("simpledialog"),
      children: <Widget>[
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("colse"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  tc3() {
    return showModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text('这是模态底部面板，点击任意位置即可关闭',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24.0))));
        });
  }

  tc4(context) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('这是一个SnackBar'),
      action: SnackBarAction(
          label: '撤销',
          onPressed: () {
            print('-------------撤销');
          }),
    ));
  }

  tc5() {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return new Container(
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text('这是模态底部面板，点击任意位置即可关闭',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24.0))));
        });
  }

  tc6() {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: new Text('title'),
            message: new Text('message'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Text("11111")),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Text("22222")),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Text("33333")),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Text("44444")),
            ],
            cancelButton: new CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text("cancelButton")),
          );
        });
  }

  tc7() {
    return showCupertinoDialog(context: context, builder: (coontext){
     return CupertinoAlertDialog(
        title: new Text("title"),
        content: new Text('contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent'),
        actions: <Widget>[
          CupertinoDialogAction(
         isDestructiveAction:true,//此动作是否会破坏对象。
            child: Text("取消"),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text("确定"),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),

        ],
      );
    });
  }

  tc8() {
    return showCupertinoDialog(context: context, builder: (context){
      return CupertinoDialog(
        child: GestureDetector(child: new Text("111111"),onTap: (){
          Navigator.of(context).pop(context);
        },),
      );
    });
  }
}
