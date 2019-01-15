import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Page30 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page30State();
  }
}

class _Page30State extends State<Page30> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('圆形头像和图片缓存'),
      ),
      body: Column(
        children: <Widget>[
          new ClipOval(
            child: new FadeInImage.assetNetwork(
              placeholder: "assets/lb1.jpeg",
              //预览图
              fit: BoxFit.fitWidth,
              image:
                  "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58",
              width: 60.0,
              height: 60.0,
            ),
          ),
          new CircleAvatar(
            backgroundImage: new NetworkImage(
                "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
            child: new Text("李二"), //可以在图片上添加文字等等
          ),
          //缓存图片
          new CachedNetworkImage(
            placeholder: new CircularProgressIndicator(),
            imageUrl:
                'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58',
          ),
          Image.network('https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58'),
        ],
      ),
    );
  }
}
