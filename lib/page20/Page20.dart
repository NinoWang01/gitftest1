import 'package:flutter/material.dart';

class Page20 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page20State();
  }
}

class _Page20State extends State {
  List<Widget> list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = new AnimationController(
      // 因为是repeat的，这里的duration其实不care
        duration: const Duration(milliseconds: 200),
        vsync: this)
      ..addListener(() {
        if (_rainList.isEmpty) { //(1)
          _animation.stop();
        }
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("画笔-水滴动画"),
      ),
      body: ListView(
        children: list.toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("add"),
          onPressed: () {
            setState(() {
              list.add(Text('111111'));
            });
          }),
    );
  }
}




class RainDrop extends CustomPainter {
  RainDrop(this.rainList);

  List<RainDropDrawer> rainList = List(); // 雨点列表
  Paint _paint = new Paint()..style = PaintingStyle.stroke; // 配置画笔

  @override
  void paint(Canvas canvas, Size size) {
    rainList.forEach((item) {
      item.drawRainDrop(canvas, _paint); // 实际的绘制逻辑
    });
    rainList.removeWhere((item) { // 移出无效对象
      return !item.isValid();
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
// ...
}



class RainDropDrawer {
  static const double MAX_RADIUS = 30;
  double posX;
  double posY;
  double radius = 5;

  RainDropDrawer(this.posX, this.posY); // (2)

  drawRainDrop(Canvas canvas, Paint paint) { // (1)
    double opt = (MAX_RADIUS - radius) / MAX_RADIUS; // (3)
    paint.color = Color.fromRGBO(0, 0, 0, opt);
    canvas.drawCircle(Offset(posX, posY), radius, paint); // (4)
    radius += 0.5;
  }

  bool isValid() { // (5)
    return radius < MAX_RADIUS;
  }
}