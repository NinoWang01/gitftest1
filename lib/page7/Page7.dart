import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Page7 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page7State();
  }
}

class _Page7State extends State {
  var showData = "在这里显示网络请求内容";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("原生请求"),
                onPressed: () {
                  getData1();
                }),
            RaisedButton(
                child: Text("三方库http"),
                onPressed: () {
                  getData2();
                }),
            RaisedButton(
                child: Text("三方库dio"),
                onPressed: () {
                  getData3();
                }),
            Text('$showData'),
          ],
        ),
      ),
    );
  }

  void getData1() async {
    var httpClient = new HttpClient();
    var url = "https://httpbin.org/ip";

    String result = "default null";

    try {
      var uri = Uri.parse(url);
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        var data = jsonDecode(responseBody);
        result = data.toString();
      } else {
        result = 'error code : ${response.statusCode}';
      }
    } catch (e) {
      result = '网络异常';
    }
    if (!mounted) return;

    setState(() {
      showData = 'btn1' + result;
    });
  }

  void getData2() async {
    String result = "default null";

    var client = new http.Client();
    var url = "https://httpbin.org/ip";

    try {
      http.Response response = await client.get(url);
      if (response.statusCode == HttpStatus.ok) {
        var responsebody = response.body;
//        result = responsebody.toString();

        var data = jsonDecode(responsebody.toString());
        result = data.toString();
      } else {
        result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      result = '网络异常';
    }

    setState(() {
      showData = 'btn2' + result;
    });
  }

  void getData3() async {
    String result = "default null";

    Dio dio = new Dio();
    var url = "https://httpbin.org/ip";

    try {
      Response response = await dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        var data = response.data;
        var data_str = response.data.toString();
        //bu需要jsonDecode(),直接取值
//        result = data['origin'];
        result = data_str;
      } else {
        result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      result = '网络异常';
    }

    setState(() {
      showData = 'btn3' + result;
    });
  }
}
