import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gitftest1/page9/User.dart';

class Page9 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page9State();
  }
}

class _Page9State extends State<Page9> {
  var myJson = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Text(myJson),
      ),
    );
  }

  @override
  void initState() {
    var testJson = '{"name": "John Smith", "email": "john@example.com"}';

    Map<String, dynamic> user = json.decode(testJson);
    print('Howdy, ${user['name']}!');
    print('We sent the verification link to ${user['email']}.');

    var usr = User.fromJson(user);
    print('Howdy, ${usr.name}!');
    print('We sent the verification link to ${usr.email}.');

    setState(() {
      myJson = user['email'];
    });
  }
}
