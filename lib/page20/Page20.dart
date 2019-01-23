import 'package:flutter/material.dart';

class Page20 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page20State();
  }
}

class _Page20State extends State {
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..blendMode = BlendMode.exclusion //颜色混合模式
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..colorFilter = ColorFilter.mode(Colors.blueAccent,
        BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
    ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    ..strokeWidth = 15.0; //画笔的宽度

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("画笔-水滴动画"),
      ),
      body: Stack(
        children: [
          GestureDetector(//手势探测器，一个特殊的widget，想要给一个widge添加手势，直接用这货包裹起来
            onPanUpdate: (DragUpdateDetails details) {//按下
              RenderBox referenceBox = context.findRenderObject();
              Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
              setState(() {
                _points = new List.from(_points)..add(localPosition);
//              _points.add(localPosition);
              });
            },
            onPanEnd: (DragEndDetails details) => _points.add(null),//抬起来
          ),
          CustomPaint(painter: new SignaturePainter(_points))
        ],
      ),
    );
  }

}

/**
 * 通过继承CustomPainter 自定义一个控件
 */
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points; // Offset:一个不可变的2D浮点偏移。

  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint() //设置笔的属性
      ..color = Colors.blue[200]
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 12.0

      ..strokeJoin = StrokeJoin.bevel;

    for (int i = 0; i < points.length - 1; i++) {
      //画线
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1],
            paint); //drawLine(Offset p1, Offset p2, Paint paint) → void
//      canvas.drawOval(
//          new Rect.fromCircle(center: points[i], radius: 20.0), paint);
////      canvas.drawOval(rect, paint)
//    canvas.drawCircle(points[i], 20.0, paint);
    }
  }

  /**
   * 是否重绘
   */
  bool shouldRepaint(SignaturePainter other) => other.points != points;
//  bool shouldRepaint(SignaturePainter other) =>true;
}


