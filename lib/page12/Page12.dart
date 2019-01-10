import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Page12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page12State();
  }
}

class Page12State extends State<Page12> {
  var showData = '数据在这里显示';
  List<bool> stateList = [true, false, false];
  var _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("文件存储+sqlite"),
        ),
        body: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            children: <Widget>[
              CupertinoButton(
                color: stateList[0] ? Colors.red : Colors.blue,
                child: Text("文件存储"),
                onPressed: () {
                  changeState(0);
                },
              ),
              new Divider(),
              CupertinoButton(
                color: stateList[1] ? Colors.red : Colors.blue,
                child: Text("sharedPreferences"),
                onPressed: () {
                  changeState(1);
                },
              ),
              new Divider(),
              CupertinoButton(
                color: stateList[2] ? Colors.red : Colors.blue,
                child: Text("sqlite"),
                onPressed: () {
                  changeState(2);
                },
              ),
              new Divider(),
              TextField(
                controller: _textFieldController,
              ),
              new Divider(),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    color: Colors.green,
                    child: Text("save"),
                    onPressed: () {
                      if (stateList[0]) {
                        fileSave().then((val) {
                          sharedPreferencesSave().then((val) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("save_ok")));
                          });
                        });
                      } else if (stateList[1]) {
                        sharedPreferencesSave().then((val) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("save_ok")));
                        });
                      } else {
                        sqliteSave().then((val) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("save_ok")));
                        });
                      }
                    },
                  );
                },
              ),
              new Divider(),
              RaisedButton(
                color: Colors.yellow,
                child: Text("reload"),
                onPressed: () {
                  if (stateList[0]) {
                    fileGet();
                  } else if (stateList[1]) {
                    sharedPreferencesGet();
                  } else {
                    sqliteGet();
                  }
                },
              ),
              new Divider(),
              Text(showData),
            ],
          ),
        ));
  }

  changeState(int val) {
    stateList.clear();
    for (int i = 0; i < 3; i++) {
      if (i == val) {
        stateList.add(true);
      } else {
        stateList.add(false);
      }
    }
    setState(() {
      stateList;
    });
  }

  fileSave() async {
    ///data/data/com.example.gitftest1/app_flutter/nameFile.txt
    final directory = await getApplicationDocumentsDirectory();
    final file = new File('${directory.path}/nameFile.txt');
    file.writeAsString(_textFieldController.value.text.toString());
  }

  sharedPreferencesSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("testdata", _textFieldController.value.text.toString());
  }

  sqliteSave() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "name.db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)");
    });
    database.transaction((trx) {
      trx.rawInsert(
          'INSERT INTO user(name) VALUES("${_textFieldController.value.text.toString()}")');
    });
  }

  fileGet() async {
    ///data/data/com.example.gitftest1/app_flutter/nameFile.txt
    final directory = await getApplicationDocumentsDirectory();
    print('----------------${directory.path}/nameFile.txt');
    final file = new File('${directory.path}/nameFile.txt');
    String readData = await file.readAsString();
    setState(() {
      showData = readData;
    });
  }

  sharedPreferencesGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      showData = prefs.getString("testdata");
    });
  }

  sqliteGet() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "name.db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)");
    });
    List<Map> list = await database.rawQuery('SELECT * FROM user');
    setState(() {
      showData = list[0]['name'];
    });
  }
}
