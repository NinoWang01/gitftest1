import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Page17 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ManHuaInfo();
  }
}

class _ManHuaInfo extends State {
  Map data = new Map();
  List gridData = new List();
  bool shunxu = false;
  var sumNum = 0;
  var lastUpdateTime = '0-0-0';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: new Text("SliverAppBar title"),
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.orange[400],
                    textTheme: TextTheme(
                        caption: TextStyle(color: Colors.white),
                        title: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Text("我是一个帅气的标题",
                          style: TextStyle(
                        color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Image.network(
                            data["cover"],
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                            child: new Container(
//            color: Colors.grey[200],
                              padding: const EdgeInsets.all(30.0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: new BoxDecoration(
                                  color: Colors.grey.shade900.withOpacity(0.5)),
//            child: new Center(
//              child: new Text('Test'),
//            ),
                            ),
                          ),
                          new Positioned(
                              bottom: 10,
                              child: GestureDetector(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Image.network(
                                      data["cover"],
                                      height: 140,
                                      width: 115,
                                    ),
                                    Container(
                                      height: 130,
                                      width: MediaQuery.of(context).size.width -
                                          130,
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            data['bookTitle'] == null
                                                ? ""
                                                : data["bookTitle"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          new Text(
                                            data['keywords'] == null
                                                ? ""
                                                : data["keywords"],
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          new Text(
                                            data['introduction'] == null
                                                ? ""
                                                : data["introduction"],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          new Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Icon(
                                                Icons.whatshot,
                                                color: Colors.white,
                                              ),
                                              new Text(
                                                data['hot'] == null
                                                    ? "0"
                                                    : data["hot"].toString(),
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),

//            new Text(listViewData[index]['hot']),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  print("aaaaaaaaa");
                                },
                              )),

//                          Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",fit:BoxFit.fill ,),
                        ],
                      ),
                    ),

//                        Image.network(
//                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
//                          fit: BoxFit.fill,
//                        )),
                  ),
                ];
              },
              body: ListView(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(data['state']==null?'连载中':data['state']),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text("共${sumNum}话 $lastUpdateTime更新"),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  shunxu ? '正序' : '倒序',
                                  textAlign: TextAlign.end,
                                ),
                                Icon(
                                  Icons.reorder,
                                  color: Colors.grey[400],
                                )
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                gridData = changeListShunXu();
                                shunxu = !shunxu;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[300],
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  new Container(
                    height: (gridData.length* 18.75),
                    child: new GridView.count(
                      physics: new NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 5),
                      children: new List.generate(gridData.length, (index) {
                        return GestureDetector(
                          child: Container(
                            child: listItemWidget(index),
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 8, right: 8),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300],
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
//              color: Colors.red,
                          ),
                          onTap: () {},
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: RaisedButton(
              color: Colors.orange[400],
              elevation: 0.0,
              highlightElevation: 0.0,
              disabledElevation: 0.0,
              child: Text(
                "立即阅读",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  listItemWidget(index) {
    return Text(
      gridData[index]['title'].toString(),
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 17.0,
        color: Colors.grey[700],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    data['cover'] =
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg';
    getInfoData();
    getGridData();
    super.initState();
  }

  void getInfoData() async {
    Dio dio = new Dio();
    FormData formData = new FormData.from({
      'uid': '0',
      'timestamp': '1543649162673',
      'platform': 'Android',
      'app_version': '3.1.5',
      'device_id': '69a00193d18ccea23110e17a11022335',
      'token': '',
      'channel_id': '6192',
      'sign': '747331a77826e11e7a84b5094be9a865',
      'bid': '74',
    });
    var response = await dio.post(
        'http://client.api.pufei.net/api/book/cartoon-info',
        data: formData);

    if (response.statusCode == 200) {
      setState(() {
//        String rel = response.data.toString();
//        while(rel.indexOf('[')!=-1){
//          rel = rel.substring(rel.indexOf('['));
//          String key =
//              rel.substring(rel.indexOf('[') + 2, rel.indexOf(']') - 1);
//          rel = rel.substring(rel.indexOf(']'));
//          rel = rel.substring(rel.indexOf('\"')+1);
//          String val = rel.substring(0,rel.indexOf('\"'));
//          data[key] = val;
//          print('--------------'+key+'-----'+val);
//        }
        data = response.data['data'];
      });
    } else {
      print("---------------------------------------Error");
    }
  }

  void getGridData() async {
    Dio dio = new Dio();
    FormData formData = new FormData.from({
      'uid': '0',
      'timestamp': '1543649162807',
      'platform': 'Android',
      'app_version': '3.1.5',
      'device_id': '69a00193d18ccea23110e17a11022335',
      'token': '',
      'channel_id': '6192',
      'sign': '277f0c5a751c2bd32944d48d4b18fd04',
      'sortType': 'ASC',
      'bid': '74',
    });
    var response = await dio
        .post('http://client.api.pufei.net/api/book/chapters', data: formData);

    if (response.statusCode == 200) {
      setState(() {
        gridData = response.data["data"]['list'];
        gridData = changeListShunXu();

        sumNum = response.data["data"]['count'];
        lastUpdateTime = DateTime.fromMillisecondsSinceEpoch(response.data['data']['lastUpdateTime']*1000).toString().substring(0,10);


//        lastUpdateTime = DateTime.fromMillisecondsSinceEpoch(response.data['lastUpdateTime']).toString();
        print('---------------'+DateTime.now().millisecondsSinceEpoch.toString());
//        DateTime.fromMillisecondsSinceEpoch(new DateTime.now().millisecondsSinceEpoch);
      });
    } else {
      print("---------------------------------------Error");
    }
  }

  changeListShunXu() {
    if (gridData.length != null && gridData.length != 0) {
      List _listCache = new List();
      for (int i = 0; i < gridData.length; i++) {
        _listCache.add(gridData[gridData.length - i - 1]);
      }
      return _listCache;
    }
  }
}