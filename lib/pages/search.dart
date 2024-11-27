import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_wallpaper/utils/loader.dart';
import 'package:my_flutter_wallpaper/widget/widget.dart';

import '../models/photo_model.dart';

// https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  TextEditingController searchcontroller = new TextEditingController();
  bool loader = false;

  getSearchWallpaper(String searchQuery) async {
    setState(() {
      loader = true;
    });
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),
        headers: {
          "Authorization":
              "PLu1ER76ggSeyjFj8x9ZzR0FqM1JqcJVfTk2tW1nSvfn2ZXIh2wKcLd6"
        }).then((value) {
      // log(
      //   value.body,
      //   name: 'Response => ',
      // );
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
    });
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: TextField(
                controller: searchcontroller,
                onChanged: (value) {
                  getSearchWallpaper(searchcontroller.text);
                },
                onSubmitted: (value) {
                  setState(() => loader = true);
                  getSearchWallpaper(searchcontroller.text);
                  setState(() => loader = false);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() => loader = true);
                      getSearchWallpaper(searchcontroller.text);
                      setState(() => loader = false);
                    },
                    child: Icon(
                      Icons.search_outlined,
                      color: Color.fromARGB(255, 84, 87, 93),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: loader
                  ? Center(
                      child: Loader(
                        heightWidth: 30,
                      ),
                    )
                  : wallpaper(
                      photos,
                      context,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
