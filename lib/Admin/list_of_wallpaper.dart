import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';
import 'package:my_flutter_wallpaper/utils/text-style.dart';

import 'admin_home.dart';

enum EnumForListCategory {
  free,
  paid,
}

class WallpaperDetails {
  const WallpaperDetails({
    required this.image,
    required this.title,
    required this.category,
  });

  final String image;
  final String title;
  final String category;
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
  String staticImage = "images/sample_ss.png";

  @override
  void initState() {
    if (widget.arguments != null && widget.arguments is EnumForListCategory) {
      enumForListCategory = widget.arguments as EnumForListCategory;
      if (enumForListCategory == EnumForListCategory.free) {
        listOfWallpapers = List.generate(
          15,
          (index) => WallpaperDetails(
            image: staticImage,
            title: 'BMW R1250 GSA',
            category: 'Free Wallpaper',
          ),
        );
      }
      if (enumForListCategory == EnumForListCategory.paid) {
        listOfWallpapers = List.generate(
          15,
          (index) => WallpaperDetails(
            image: staticImage,
            title: 'BMW R1250 GSA',
            category: 'Paid Wallpaper',
          ),
        );
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: CustomText(
          text: 'Wallpapers',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      body: listOfWallpapers.isEmpty
          ? Center(
              child: CustomText(
                text: 'No Wallpaper Available',
                fontSize: 18,
                color: Colors.black.withOpacity(
                  0.5,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: listOfWallpapers.length,
                    itemBuilder: (context, index) {
                      WallpaperDetails wallpaperDetails =
                          listOfWallpapers[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.symmetric(
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
                              child: Image.asset(
                                wallpaperDetails.image,
                                height: 60,
                                width: 60,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                text: wallpaperDetails.title,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.addEditWallpaper,
                                      arguments:
                                          NavigationForAddEditWallpaperState(
                                        title: enumForListCategory ==
                                                EnumForListCategory.paid
                                            ? 'Edit Paid Wallpaper'
                                            : 'Edit Free Wallpaper',
                                        navigationEnum: enumForListCategory ==
                                                EnumForListCategory.paid
                                            ? NavigationEnum.editPaidWallpaper
                                            : NavigationEnum.editFreeWallpaper,
                                        argument: NavigationData(
                                          category: enumForListCategory ==
                                                  EnumForListCategory.paid
                                              ? 'Paid Fifth'
                                              : 'Free Second',
                                          image: wallpaperDetails.image,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
