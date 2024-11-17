import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_wallpaper/utils/loader.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';
import 'package:my_flutter_wallpaper/utils/text-style.dart';

import '../pages/login.dart';
import 'list_of_wallpaper.dart';

enum NavigationEnum {
  addWallpaper,
  editWallpaper,
}

class NavigationForAddEditWallpaperState {
  const NavigationForAddEditWallpaperState({
    required this.title,
    required this.navigationEnum,
    this.argument = null,
  });

  final String title;
  final NavigationEnum navigationEnum;
  final NavigationData? argument;
}

class NavigationData {
  const NavigationData({
    required this.category,
    this.image = '',
  });

  final String category;
  final String image;
}

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

/// Todo :- @RahulMistry , please use loader when you call api , i'll provide you a sample function for loader every page
class _AdminHomeState extends State<AdminHome> {
  bool loader = false;

  @override
  void initState() {
    loaderSample();
    super.initState();
  }

  void loaderSample() async {
    setState(
      () => loader = true,
    );

    /// Todo :- @RahulMistry , apply here by removing Future.delayed
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    setState(
      () => loader = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CustomText(
          text: 'Admin',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(SignInPage());
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
              size: 22,
            ),
          )
        ],
      ),
      body: loader
          ? Center(
              child: Loader(
                heightWidth: 30,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Registered User",
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                              CustomText(
                                text: "1,234",
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Row(
                //   children: [
                commonContainer(
                  title: 'Add Free Wallpaper',
                  navigationEnum: NavigationEnum.addWallpaper,
                ),
                //     Expanded(
                //       child: commonContainer(
                //         title: 'Add Paid Wallpaper',
                //         navigationEnum: NavigationEnum.addPaidWallpaper,
                //         backGroundColor: Colors.orangeAccent,
                //       ),
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.wallpaperList,
                                arguments: EnumForListCategory.free,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 18,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: 'List of Free Wallpapers',
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    weight: 50,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.wallpaperList,
                                arguments: EnumForListCategory.paid,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 18,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: 'List of Paid Wallpapers',
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    weight: 50,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                    ),
                  ],
                )
              ],
            ),
    );
  }

  Widget commonContainer({
    required String title,
    required NavigationEnum navigationEnum,
    Color backGroundColor = Colors.black,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addEditWallpaper,
            arguments: NavigationForAddEditWallpaperState(
              title: title,
              navigationEnum: navigationEnum,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 18,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: backGroundColor == Colors.black
                    ? Colors.white
                    : Colors.black,
                size: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomText(
                  text: title,
                  fontSize: 15,
                  color: backGroundColor == Colors.black
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
}
