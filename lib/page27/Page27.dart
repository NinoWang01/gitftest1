import 'package:flutter/material.dart';
import 'dart:math'as math;

class Page27 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page27State();
  }

}

class _Page27State extends State<Page27>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("自定义ScrollPhysics"),),
    body: ListView.custom(
      physics:_SnappingScrollPhysics(midScrollOffset:50),//控制滚动的发生方式,取消滑动

      itemExtent: 20.0,
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
          return new Text("index $index");
        },
        childCount: 100,
      ),
    ),);
  }
}

class _SnappingScrollPhysics extends ClampingScrollPhysics {
  const _SnappingScrollPhysics({
    ScrollPhysics parent,
    @required this.midScrollOffset,
  }) : assert(midScrollOffset != null),
        super(parent: parent);

//中间的偏移量。用于区分
  final double midScrollOffset;

  @override
  _SnappingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return new _SnappingScrollPhysics(parent: buildParent(ancestor), midScrollOffset: midScrollOffset);
  }

  //粘性到中间的移动
  Simulation _toMidScrollOffsetSimulation(double offset, double dragVelocity) {
    //去到滑动的速度和默认最小Fling速度的最大值
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    //创建ScrollSpringSimulation。
    return new ScrollSpringSimulation(spring, offset, midScrollOffset, velocity, tolerance: tolerance);
  }

  //粘性到原点的移动
  Simulation _toZeroScrollOffsetSimulation(double offset, double dragVelocity) {
    //去到滑动的速度和默认最小Fling速度的最大值
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return new ScrollSpringSimulation(spring, offset, 0.0, velocity, tolerance: tolerance);
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double dragVelocity) {
    //得到父类的模拟，我们再修改
    final Simulation simulation = super.createBallisticSimulation(position, dragVelocity);
    //得到当前的偏移
    final double offset = position.pixels;

    if (simulation != null) {
      //通过这方法,可以快速拿到终止的位置
      final double simulationEnd = simulation.x(double.infinity);
      //当终止的位置大于midScrollOffset时，可以不进行处理，正常滑动
      if (simulationEnd >= midScrollOffset)
        return simulation;
      //当小于mid,而且速度方向向上的话，就粘性到中间
      if (dragVelocity > 0.0)
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      //当小于mid,而且速度方向向下的话，就粘性到底部
      if (dragVelocity < 0.0)
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    } else {
      //如果停止时，没有触发任何滑动效果，那么，当滑动在上部时，而且接近mid，就会粘性到mid
      final double snapThreshold = midScrollOffset / 2.0;
      if (offset >= snapThreshold && offset < midScrollOffset)
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      //如果滑动在上部，而且贴近底部的话，就粘性到底部。
      if (offset > 0.0 && offset < snapThreshold)
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    }
    return simulation;
  }
}

