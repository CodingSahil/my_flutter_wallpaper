import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/utils/loader.dart';
import 'package:my_flutter_wallpaper/utils/text-style.dart';
import 'package:image_picker/image_picker.dart';

import 'admin_home.dart';

class AddEditWallpaper extends StatefulWidget {
  const AddEditWallpaper({
    super.key,
    required this.arguments,
  });

  final dynamic arguments;

  @override
  State<AddEditWallpaper> createState() => _AddEditWallpaperState();
}

class _AddEditWallpaperState extends State<AddEditWallpaper> {
  bool loader = false;
  bool actionLoader = false;
  bool isAddEditPaidWallpaper = false;
  List<String> wallpaperCategories = [
    'None',
    'Wildlife',
    'Cars',
    'Nature',
    'MarvelStudio',
  ];
  String selectedFreeCategories = '';
  String selectedPaidCategories = '';
  XFile? image;

  NavigationForAddEditWallpaperState? state;

  @override
  void initState() {
    selectedFreeCategories = wallpaperCategories.first;
    selectedPaidCategories = wallpaperCategories.first;
    if (widget.arguments != null &&
        widget.arguments is NavigationForAddEditWallpaperState) {
      state = widget.arguments as NavigationForAddEditWallpaperState;
      if (state != null &&
          state!.argument != null &&
          state!.argument!.image.isNotEmpty) {
        File file = File(state!.argument!.image);
        image = XFile(file.path);
      }
      if (state != null &&
          state!.navigationEnum == NavigationEnum.editWallpaper) {
        if (state != null && state!.argument != null) {
          selectedFreeCategories = state!.argument!.category;
          selectedPaidCategories = state!.argument!.category;
        } else {
          selectedFreeCategories = wallpaperCategories.first;
          selectedPaidCategories = wallpaperCategories.first;
        }
      }
    }
    // log(wallpaperCategories.length.toString());
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

  void actionCallBack() async {
    setState(
      () => actionLoader = true,
    );

    /// Todo :- @RahulMistry , apply here by removing Future.delayed
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    setState(
      () => actionLoader = false,
    );
    Navigator.pop(context);
  }

  /// Todo :- @RahulMistry , i apply this for scenario of if you select category of free wallpaper , paid wallpaper will automatically select as none and visa-versa
  void validationForDropDown({
    bool changInPaidWallpaper = false,
  }) {
    if (changInPaidWallpaper) {
      selectedFreeCategories = wallpaperCategories.first;
    } else {
      selectedPaidCategories = wallpaperCategories.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: CustomText(
          text: state != null ? state!.title : 'Add',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      body: loader
          ? Center(
              child: Loader(
                heightWidth: 30,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (image != null) ...[
                          Expanded(
                            child: Stack(
                              children: [
                                Image.file(
                                  File(
                                    image!.path,
                                  ),
                                  // height: 150,
                                  // width: 150,
                                  // fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          SizedBox(height: 25),
                        ],
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            image = await picker.pickImage(
                              source: ImageSource.gallery,
                              maxWidth: 400,
                            );
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              CustomText(
                                text: 'Upload Wallpaper',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Spacer(),
                  if (wallpaperCategories.isNotEmpty) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Free Category',
                          fontSize: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                value: selectedFreeCategories,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                items: wallpaperCategories
                                    .map<DropdownMenuItem<String>>(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: CustomText(
                                          text: e,
                                          fontSize: 14,
                                          // color: Colors.black,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedFreeCategories = value!;
                                    validationForDropDown();
                                    // log(selectedFreeCategories.toString());
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Paid Category',
                          fontSize: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                value: selectedPaidCategories,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                items: wallpaperCategories
                                    .map<DropdownMenuItem<String>>(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: CustomText(
                                          text: e,
                                          fontSize: 14,
                                          // color: Colors.black,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaidCategories = value!;
                                    validationForDropDown(
                                      changInPaidWallpaper: true,
                                    );
                                    // log(selectedPaidCategories.toString());
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: actionCallBack,
                    child: Container(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: state != null && isAddEditPaidWallpaper
                            ? Colors.orangeAccent
                            : Colors.black,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: actionLoader
                          ? Center(
                              child: Loader(
                                color: state != null && isAddEditPaidWallpaper
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            )
                          : CustomText(
                              text: state != null
                                  ? state!.title
                                  : 'Add Wallpaper',
                              fontSize: 20,
                              color: state != null && isAddEditPaidWallpaper
                                  ? Colors.black
                                  : Colors.white,
                            ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
    );
  }
}
