import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:my_flutter_wallpaper/widget/widget.dart';
class FullScreen extends StatefulWidget {
  String imaagepath;
  FullScreen({required this.imaagepath});

  @override
  State<FullScreen> createState() => _FullScreenState();

}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(tag: widget.imaagepath, child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(imageUrl: widget.imaagepath,fit: BoxFit.cover ,),
          )),
          Container(
            margin: EdgeInsets.only(bottom:  50.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      _save();
                    },
                  ),
                  Container(
                    height: 90,
                    width: MediaQuery.of(context). size.width/2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54,width: 2),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Color(0x36ffffff),Color(0x0ffffff)])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Set Wallpaper",style: TextStyle(fontSize: 16.0,color: Colors.white,fontFamily: 'Poppins'),),
                              Text("Image Will Be saved in a gallery",style: TextStyle( fontSize: 12.0,color: Colors.white),)
                            ],
                          ),

                    ),

                ],
              ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                Text("Cancel",style: TextStyle( fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
                )

              ],),
          )
        ],
      ),
    );

  }
}

// _save() async{
//    var response = await Dio().get(widget.imagepath,
//    options: Options(responseType: ResponseType.bytes));
//    final result =
//        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
//    print(result);
//    Navigator.pop(context);
}