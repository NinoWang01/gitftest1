import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Page34 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page34State();
  }

}

class _Page34State extends State<Page34>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text('photoview-全屏看照片'),),body: Container(
        child: PhotoViewGallery(
          pageOptions: <PhotoViewGalleryPageOptions>[
            PhotoViewGalleryPageOptions(
              imageProvider: AssetImage("assets/lb1.jpeg"),
              heroTag: "tag1",
            ),
            PhotoViewGalleryPageOptions(
                imageProvider: AssetImage("assets/lb2.jpeg"),
                heroTag: "tag2",
                maxScale: PhotoViewComputedScale.contained * 0.3
            ),
            PhotoViewGalleryPageOptions(
              imageProvider: AssetImage("assets/lb3.jpeg"),
              initialScale: PhotoViewComputedScale.contained * 0.98,
              heroTag: "tag3",
            ),
          ],
          backgroundDecoration: BoxDecoration(color: Colors.black87),
        )
    ));
  }


//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: PhotoView(
//          imageProvider: AssetImage("assets/large-image.jpg"),
//        )
//    );
//  }
}