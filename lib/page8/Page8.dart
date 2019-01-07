import 'package:flutter/material.dart';

class Page8 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _page8State();
  }
}

class _page8State extends State<Page8> {
  var result = '内容在这里展示';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('异步'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Builder(builder: (context){
              return RaisedButton(
                color: Colors.blue[300],
                child: Text("异步1--3s"),
                onPressed: () {
                  yb1(context);
                },
              );
            },),
        Builder(builder: (context){
          return RaisedButton(
          color: Colors.blue[300],
          child: Text("异步2--异步逐行代码运行"),
          onPressed: () {
            return yb2(context);
          },
        );}),


            RaisedButton(
              color: Colors.blue[300],
              child: Text("异步3--从异步方法获取返回值"),
              onPressed: () async{//await必须在async方法中调用
                String str = await yb3();
                setState(() {
                  result = str;
                });

              },
            ),
            RaisedButton(
              color: Colors.blue[300],
              child: Text("异步4---链式调用1"),
              onPressed: () {//await必须在async方法中调用
                yb4();
              },
            ),
            RaisedButton(
              color: Colors.blue[300],
              child: Text("异步5---链式调用2wait"),
              onPressed: () {//await必须在async方法中调用
                yb5();
              },
            ),
            Text('$result'),
          ],
        ),
      ),
    );
  }

   yb1(context) async{
    await Future.delayed(Duration( seconds: 3));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("yb1")));
  }

   yb2(context) async{
    setState(() {
      result = "_loadUserInfo:${new DateTime.now()}";
    });

     await yb1(context);
     setState(() {
       result = result+'\n_loadUserInfo:${new DateTime.now()}';
     });

   }

    Future yb3() async{
    await Future.delayed(Duration(seconds: 3));
     return "yb3";
   }

    yb4() {
      yb4_1().then((yb41Valuse){
       return yb4_2(yb41Valuse);
      }).then((yb42valuse){
        return yb4_3(yb42valuse);
      }).then((yb43valuse){
        setState(() {
          result = yb43valuse;
        });
      });
    }

    yb4_1() async{
     await Future.delayed(Duration(seconds: 3));
           return "yb_1的数据";
    }
   yb4_2(val) async{
    await Future.delayed(Duration(seconds: 3));
      return val+"|yb_2的数据";
    }
   yb4_3(val) async{
    await Future.delayed(Duration(seconds: 3));
    return val+"|yb_3的数据";
  }

   yb5() {
      Future
          .wait([yb5_1(),yb5_2(),yb5_3()])
          .then((List val) => setState((){
//            result = val.toString();
      String res = "";
         val.forEach((val){
           res +=val;
        });
      result = res;
      }))
          .catchError((e) => setState((){
        result = 'error'+e;
      }));
   }

  Future yb5_1() async{//使用await需要在方法前加上Future
    await Future.delayed(Duration(seconds: 3));
    return "yb_1的数据";
  }
  Future yb5_2() async{
    await Future.delayed(Duration(seconds: 3));
    return "|yb_2的数据";
  }
  Future yb5_3() async{
    return   Future.delayed(new Duration(seconds: 3), () => "|yb_3的数据");
  }
}
