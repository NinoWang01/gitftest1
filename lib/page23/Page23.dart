import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page23 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page23State();
  }
}

class _Page23State extends State<Page23> {
  var myDate = '时间日期:';
  DateTime _mydateTime = DateTime.now();
  TimeOfDay _myTimeofDay = TimeOfDay.now();

  var cupDate = '';
  var cupTime = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('时间和日期'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(
                child: Text('md时间日期选择器' + _mydateTime.toString()),
                onPressed: () {
                  rq1();
                }),
            Divider(),
            RaisedButton(
                child: Text('md时间日期选择器' + _myTimeofDay.toString()),
                onPressed: () {
                  rq2();
                }),
            Divider(),
            RaisedButton(
                child: Text('cupertino日期选择器' + cupDate),
                onPressed: () {
                  rq3();
                }),
            Divider(),
            RaisedButton(
                child: Text('cupertino倒计时' + cupTime),
                onPressed: () {
                  rq4();
                }),
            Divider(),
            RaisedButton(
                child: Text('获取时间日期方法'),
                onPressed: () {
                  rq5();
                }),
            Divider(),
            Text(myDate),
          ],
        ),
      ),
    );
  }

  rq1() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: _mydateTime,
      firstDate: DateTime(2016),
      lastDate: DateTime(2020),
    );
    if (dateTime != null) {
      setState(() {
        _mydateTime = dateTime;
      });
    }
  }

  rq2() async {
    TimeOfDay timeOfDay =
        await showTimePicker(context: context, initialTime: _myTimeofDay);
    if (timeOfDay != null) {
      setState(() {
        _myTimeofDay = timeOfDay;
      });
    }
  }

  rq3() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return _buildBottomPicker(CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: _mydateTime,
              onDateTimeChanged: (newDateTime) {
                setState(() {
                  cupDate = newDateTime.toString();
                });
              }));
        });
  }

  rq4() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return _buildBottomPicker(
              CupertinoTimerPicker(onTimerDurationChanged: (newTime) {
            setState(() {
              cupTime = newTime.toString();
            });
          }));
        });
  }

  rq5() {
    setState(() {
      myDate = myDate +
          DateTime.now().toString() + //DateTime.now()是DateTime格式
          '----' +
          TimeOfDay.now().hour.toString();
    });
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
