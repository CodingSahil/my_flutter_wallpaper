import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';
import 'package:my_flutter_wallpaper/utils/text-style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'admin_home.dart';

enum EnumForListCategory {
  free,
  paid,
}

class WallpaperDetails {
  const WallpaperDetails({
    required this.image,
    required this.category,
    required this.price,
    required this.type,
  });

  final String image;
  final String category;
  final String price;
  final String type;

  factory WallpaperDetails.fromJson(Map<String, dynamic> json) {
    return WallpaperDetails(
      image: json['image_url'] ?? 'images/sample_ss.png',
      category: json['category'] ?? 'Category Name',
      price: json['price'] ?? '00.00',
      type: json['type'] ?? 'Free',
    );
  }
}

class ListOfWallpaper extends StatefulWidget {
  const ListOfWallpaper({
    super.key,
    required this.arguments,
  });

  final dynamic arguments;

  @override
  State<ListOfWallpaper> createState() => _ListOfWallpaperState();
}

class _ListOfWallpaperState extends State<ListOfWallpaper> {
  List<WallpaperDetails> listOfWallpapers = [];
  EnumForListCategory enumForListCategory = EnumForListCategory.free;
  bool isLoading = true;
  String errorMessage = '';
  String staticImage = "images/sample_ss.png";

  @override
  void initState() {
    if (widget.arguments != null && widget.arguments is EnumForListCategory) {
      enumForListCategory = widget.arguments as EnumForListCategory;
      if (enumForListCategory == EnumForListCategory.free) {
        fetchFreeWallpapers();
      }
      if (enumForListCategory == EnumForListCategory.paid) {
        fetchPaidWallpapers();
      }
    }

    super.initState();
  }

  Future<void> fetchFreeWallpapers() async {
    const url =
        'https://notable-prawn-brave.ngrok-free.app/api/wallpapers/free';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          listOfWallpapers = (data['freeWallpapers'] as List)
              .map((item) => WallpaperDetails.fromJson(item))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load wallpapers. Please try again later.';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  Future<void> fetchPaidWallpapers() async {
    const url =
        'https://notable-prawn-brave.ngrok-free.app/api/wallpapers/paid';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          listOfWallpapers = (data['paidWallpapers'] as List)
              .map((item) => WallpaperDetails.fromJson(item))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load wallpapers. Please try again later.';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: CustomText(
          text: enumForListCategory == EnumForListCategory.free
              ? 'Free Wallpapers'
              : 'Paid Wallpapers',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: CustomText(
                    text: errorMessage,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                )
              : listOfWallpapers.isEmpty
                  ? Center(
                      child: CustomText(
                        text: enumForListCategory == EnumForListCategory.free
                            ? 'No Free Wallpaper Available'
                            : 'No Paid Wallpaper Available',
                        fontSize: 18,
                        color: Colors.black.withOpacity(
                          0.5,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: listOfWallpapers.length,
                      itemBuilder: (context, index) {
                        WallpaperDetails wallpaperDetails =
                            listOfWallpapers[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(
                                0.4,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  wallpaperDetails.image,
                                  height: 60,
                                  width: 60,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.image, size: 60),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Category: ' +
                                          wallpaperDetails.category,
                                      fontSize: 14,
                                    ),
                                    wallpaperDetails.type == 'paid'
                                        ? CustomText(
                                            text: 'Price: ' +
                                                wallpaperDetails.price,
                                            fontSize: 14,
                                          )
                                        : CustomText(
                                            text: 'Free',
                                            fontSize: 14,
                                          ),
                                  ],
                                ),
                              ),
                              // IconButton(
                              //   onPressed: () {
                              //     // Add Edit functionality here
                              //   },
                              //   icon: const Icon(
                              //     Icons.edit,
                              //     size: 20,
                              //   ),
                              //   color: Colors.green,
                              // ),
                              // const SizedBox(width: 10),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  // setState(() {
                                  //   listOfWallpapers.remove(wallpaperDetails);
                                  // });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
    );
  }
}
