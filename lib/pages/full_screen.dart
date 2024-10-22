import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
                            var dummyFile =
                                await defaultCacheManager.downloadFile(
                              widget.imaagepath.toString(),
                              key: 'DownloadedImage',
                            );
                            file = await defaultCacheManager.putFile(
                              dummyFile.originalUrl,
                              Uint8List(
                                dummyFile.file.lengthSync(),
                              ),
                              key: 'DownloadedImage',
                            );
                            log(file?.path.toString() ?? '', name: 'path => ');
                            final FileInfo? localFile =
                                await defaultCacheManager.getFileFromCache(
                              'DownloadedImage',
                            );
                            log(
                              localFile?.file.path.toString() ?? '',
                              name: 'localFile path => ',
                            );

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
                            setState(() {
                              loader = true;
                            });
                            var dummyFile =
                            await defaultCacheManager.downloadFile(
                              widget.imaagepath.toString(),
                              key: 'DownloadedImage',
                            );
                            file = await defaultCacheManager.putFile(
                              dummyFile.originalUrl,
                              Uint8List(
                                dummyFile.file.lengthSync(),
                              ),
                              key: 'DownloadedImage',
                            );
                            log(file?.path.toString() ?? '', name: 'path => ');
                            final FileInfo? localFile =
                            await defaultCacheManager.getFileFromCache(
                              'DownloadedImage',
                            );
                            log(
                              localFile?.file.path.toString() ?? '',
                              name: 'localFile path => ',
                            );

                            setState(() {
                              loader = false;
                            });
                            return;
                            Navigator.pushNamed(
                              context,
                              AppRoutes.makePayment,
                              arguments: 'Make a Payment !!',
                            );
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
                        log('message');
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
                        log('File Removed');
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
