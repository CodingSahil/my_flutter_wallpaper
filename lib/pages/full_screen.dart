import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gal/gal.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';
import 'package:share_plus/share_plus.dart';

// import 'package:image_gallery_saver/image_gallery_saver.dart';

enum FullScreenType {
  unPaidWallpaper,
  paidWallpaper,
}

class FullScreen extends StatefulWidget {
  final String imaagepath;
  final bool isInWishlist;
  final FullScreenType fullScreenType;

  FullScreen({
    required this.imaagepath,
    required this.fullScreenType,
    this.isInWishlist = false,
  });

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  bool isFavourite = false;
  bool loader = false;
  late final DefaultCacheManager defaultCacheManager;
  File? file;

  @override
  void initState() {
    isFavourite = widget.isInWishlist;
    defaultCacheManager = DefaultCacheManager();
    // log(
    //   widget.imaagepath,
    //   name: 'image Path => ',
    // );
    super.initState();
  }

  @override
  void dispose() {
    defaultCacheManager.emptyCache();
    super.dispose();
  }

  // void _save({
  //   required String path,
  // }) async {
  //   var response = await Dio().get(
  //     path,
  //     options: Options(
  //       responseType: ResponseType.bytes,
  //     ),
  //   );
  //   final result = await ImageGallerySaver.saveImage(
  //     Uint8List.fromList(
  //       response.data,
  //     ),
  //   );
  //   print(result);
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.imaagepath,
                  child: CachedNetworkImage(
                    imageUrl: widget.imaagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.fullScreenType == FullScreenType.unPaidWallpaper)
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            setState(() {
                              loader = true;
                            });
                            try {
                              final imagePath =
                                  '${Directory.systemTemp.path}/wall_wonders_wallpaper.jpg';
                              await Dio()
                                  .download(widget.imaagepath, imagePath);
                              await Gal.putImage(imagePath);
                              // log(
                              //   imagePath.toString(),
                              //   name: 'result => ',
                              // );
                            } catch (e) {
                              log('error => $e');
                            }

                            setState(() {
                              loader = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              color: Color.fromARGB(255, 84, 87, 93),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (loader)
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                else
                                  Text(
                                    "Set Wallpaper",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.fullScreenType == FullScreenType.paidWallpaper)
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            /// todo payment page @RahulMistry
                            // Navigator.pushNamed(
                            //   context,
                            //   AppRoutes.makePayment,
                            //   arguments: 'Make a Payment !!',
                            // );

                            /// todo @RahulMistry code of saving wallpaper to gallery
                            // setState(() {
                            //   loader = true;
                            // });
                            // try {
                            //   final imagePath =
                            //       '${Directory.systemTemp.path}/wall_wonders_paid_wallpaper.jpg';
                            //   await Dio()
                            //       .download(widget.imaagepath, imagePath);
                            //   await Gal.putImage(imagePath);
                            //   log(
                            //     imagePath.toString(),
                            //     name: 'result => ',
                            //   );
                            // } catch (e) {
                            //   log('error => $e');
                            // }
                            //
                            // setState(() {
                            //   loader = false;
                            // });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              color: Colors.orangeAccent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (loader)
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                else
                                  Text(
                                    "Make a Payment",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: 12),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      child: isFavourite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 84, 87, 93),
                              size: 30,
                            ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        File file = await defaultCacheManager
                            .getSingleFile(widget.imaagepath);
                        final result = await Share.shareXFiles(
                          [
                            XFile(
                              file.path,
                            ),
                          ],
                          text: 'Great picture',
                        );
                        if (result.status == ShareResultStatus.success) {
                          print('Thank you for sharing the picture!');
                        }
                        if (result.status == ShareResultStatus.unavailable) {
                          print('Thank you for unavailable the picture!');
                        }

                        defaultCacheManager.removeFile(
                          file.path,
                        );
                        defaultCacheManager.emptyCache();
                      },
                      child: Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 84, 87, 93),
                        size: 25,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
