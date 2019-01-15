import 'package:flutter/material.dart';

class Page22 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page22State();
  }

}

class _Page22State extends State<Page22>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("生命周期"),),body: Image.asset('assets/smzq.png'),);


  }
///当插入渲染树的时候调用，这个函数在生命周期中只调用一次。这里可以做一些初始化工作，比如初始化State的变量。
  @override
  void initState() {
    print('------initState');
  }
///  这个函数会紧跟在initState之后调用，并且可以调用BuildContext.inheritFromWidgetOfExactType
  ///
  @override
  void didChangeDependencies() {
    print('------didChangeDependencies');
  }
///当组件的状态改变的时候就会调用didUpdateWidget,比如调用了setState.
///实际上这里flutter框架会创建一个新的Widget,绑定本State，并在这个函数中传递老的Widget。
///这个函数一般用于比较新、老Widget，看看哪些属性改变了，并对State做一些调整。
///需要注意的是，涉及到controller的变更，需要在这个函数中移除老的controller的监听，并创建新controller的监听。
  @override
  void didUpdateWidget(Page22 oldWidget) {
    print('------didUpdateWidget');
  }
///在dispose之前，会调用这个函数。
  @override
  void deactivate() {
    print('------deactivate');
  }
///  一旦到这个阶段，组件就要被销毁了，这个函数一般会移除监听，清理环境。
  @override
  void dispose() {
    print('------dispose');
  }


}