import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/pages/paid.dart';
import 'package:my_flutter_wallpaper/utils/loader.dart';
import 'package:my_flutter_wallpaper/utils/text-style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    'Wildlife',
    'Cars',
    'Nature',
    'MarvelStudio',
  ];
  List<String> wallpaperType = [
    'free',
    'paid',
  ];
  String? selectedCategory;
  String? selectedType;
  XFile? image;
  // File? _pickedWallpaperImage;

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

  File? _pickedWallpaperImage; // Holds the selected image
  final _imagePicker = ImagePicker();
  final TextEditingController _priceController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedWallpaperImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadWallpaper(
      String category, String type, String? price) async {
    print(category);
    print(type);
    print(price);
    if (_pickedWallpaperImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first')),
      );
      return;
    }

    setState(() {
      actionLoader = true;
    });

    final request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://notable-prawn-brave.ngrok-free.app/api/add-wallpapers'),
    );

    // Add form fields
    request.fields['category'] = category;
    request.fields['type'] = type;
    if (type == 'paid' && price != null && price.isNotEmpty) {
      request.fields['price'] = price;
    }

    // Attach the image file
    request.files.add(
      await http.MultipartFile.fromPath('image', _pickedWallpaperImage!.path),
    );
    print(request.fields['category']);
    print(request.fields['type']);
    print(request.fields['price']);
    print(price);

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wallpaper uploaded successfully!')),
        );
        Navigator.pop(context); // Go back after successful upload
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to upload: ${responseData['message']}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        actionLoader = false;
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
          : SingleChildScrollView(
              // Wrap content in SingleChildScrollView
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align children to start
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
                          if (_pickedWallpaperImage != null) ...[
                            Expanded(
                              child: Stack(
                                children: [
                                  Image.file(
                                    _pickedWallpaperImage!,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                          ],
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: _pickImage,
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
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Select Category:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      hint: const Text('Select a category'),
                      items: wallpaperCategories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Select Type:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedType,
                      hint: const Text('Select a type'),
                      items: wallpaperType.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedType = value;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (selectedType == 'paid')
                      TextFormField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          labelText: "Price",
                          hintText: "51.00",
                          border: OutlineInputBorder(),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter price';
                          }
                          return null;
                        },
                      ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (selectedCategory != null && selectedType != null) {
                          if (selectedType == 'paid' && (_priceController.text.isEmpty || double.tryParse(_priceController.text) == null)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please enter a valid price for Paid wallpaper')),
                            );
                            return;
                          }

                          _uploadWallpaper(
                            selectedCategory!,
                            selectedType!,
                            selectedType == 'paid' ? _priceController.text.trim() : null,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please select category and type')),
                          );
                        }
                      },
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
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }
}
