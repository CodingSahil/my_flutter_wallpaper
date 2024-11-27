import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/models/photo_model.dart';

import 'full_screen.dart';

class PaidWallpaperPage extends StatefulWidget {
  const PaidWallpaperPage({super.key});

  @override
  State<PaidWallpaperPage> createState() => _PaidWallpaperPageState();
}

class _PaidWallpaperPageState extends State<PaidWallpaperPage> {
  List<PhotosModel> photos = [];

  void getSearchWallpaper() {
    Map<String, dynamic> jsonData = jsonDecode(response);
    jsonData["photos"].forEach((element) {
      PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      photos.add(photosModel);
    });
  }

  @override
  void initState() {
    getSearchWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 16),
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
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(4.0),
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                children: photos.map((PhotosModel photosModel) {
                  return GridTile(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreen(
                            imaagepath: photosModel.src!.portrait!,
                            fullScreenType: FullScreenType.paidWallpaper,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: photosModel.src!.portrait!,
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: photosModel.src!.portrait!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String response = """{
  "page": 1,
  "per_page": 30,
  "photos": [
    {
      "id": 460672,
      "width": 1999,
      "height": 1376,
      "url": "https://www.pexels.com/photo/london-cityscape-460672/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#A7978A",
      "src": {
        "original": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
        "large2x": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "London Cityscape"
    },
    {
      "id": 672532,
      "width": 2037,
      "height": 1362,
      "url": "https://www.pexels.com/photo/city-view-at-london-672532/",
      "photographer": "Dominika Gregušová",
      "photographer_url": "https://www.pexels.com/@dominikagregus",
      "photographer_id": 15941,
      "avg_color": "#959386",
      "src": {
        "original": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg",
        "large2x": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/672532/pexels-photo-672532.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "City View at London"
    },
    {
      "id": 427679,
      "width": 5346,
      "height": 3564,
      "url": "https://www.pexels.com/photo/tower-bridge-427679/",
      "photographer": "Chris Schippers",
      "photographer_url": "https://www.pexels.com/@chris-schippers-139261",
      "photographer_id": 139261,
      "avg_color": "#103B58",
      "src": {
        "original": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg",
        "large2x": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/427679/pexels-photo-427679.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Tower Bridge"
    },
    {
      "id": 1796715,
      "width": 5909,
      "height": 3325,
      "url": "https://www.pexels.com/photo/white-and-brown-sailing-ship-1796715/",
      "photographer": "Chait Goli",
      "photographer_url": "https://www.pexels.com/@chaitaastic",
      "photographer_id": 876963,
      "avg_color": "#4B6A7E",
      "src": {
        "original": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg",
        "large2x": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1796715/pexels-photo-1796715.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "White and Brown Sailing Ship"
    },
    {
      "id": 1427581,
      "width": 2592,
      "height": 3872,
      "url": "https://www.pexels.com/photo/royal-guard-standing-near-lamp-post-1427581/",
      "photographer": "Samuel Wölfl",
      "photographer_url": "https://www.pexels.com/@samuel-wolfl-628277",
      "photographer_id": 628277,
      "avg_color": "#716863",
      "src": {
        "original": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg",
        "large2x": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1427581/pexels-photo-1427581.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Royal Guard Standing Near Lamp Post"
    },
    {
      "id": 220887,
      "width": 6000,
      "height": 4000,
      "url": "https://www.pexels.com/photo/tower-bridge-of-london-220887/",
      "photographer": "Nicole Rathmayr",
      "photographer_url": "https://www.pexels.com/@nicole-rathmayr-61805",
      "photographer_id": 61805,
      "avg_color": "#455560",
      "src": {
        "original": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg",
        "large2x": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/220887/pexels-photo-220887.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Tower Bridge of London"
    },
    {
      "id": 220769,
      "width": 2200,
      "height": 1650,
      "url": "https://www.pexels.com/photo/purple-foot-bridge-220769/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#473472",
      "src": {
        "original": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg",
        "large2x": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/220769/pexels-photo-220769.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Purple Foot Bridge"
    },
    {
      "id": 77171,
      "width": 3016,
      "height": 4668,
      "url": "https://www.pexels.com/photo/big-ben-low-angle-photography-77171/",
      "photographer": "Amar Saleem",
      "photographer_url": "https://www.pexels.com/@amar-saleem-15661",
      "photographer_id": 15661,
      "avg_color": "#747D86",
      "src": {
        "original": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg",
        "large2x": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Big Ben Low-angle Photography"
    },
    {
      "id": 1647120,
      "width": 4480,
      "height": 5798,
      "url": "https://www.pexels.com/photo/photo-of-black-vehicle-at-the-road-1647120/",
      "photographer": "Humphrey Muleba",
      "photographer_url": "https://www.pexels.com/@goodcitizen",
      "photographer_id": 560785,
      "avg_color": "#716E73",
      "src": {
        "original": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg",
        "large2x": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1647120/pexels-photo-1647120.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of Black Vehicle At The Road "
    },
    {
      "id": 813362,
      "width": 4896,
      "height": 3264,
      "url": "https://www.pexels.com/photo/photo-of-people-walking-in-the-street-813362/",
      "photographer": "Peter Spencer",
      "photographer_url": "https://www.pexels.com/@f4photography",
      "photographer_id": 205481,
      "avg_color": "#7F7D82",
      "src": {
        "original": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg",
        "large2x": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/813362/pexels-photo-813362.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of People Walking in the Street"
    },
    {
      "id": 89432,
      "width": 3456,
      "height": 2304,
      "url": "https://www.pexels.com/photo/big-ben-structure-near-white-concrete-structure-89432/",
      "photographer": "Marianna",
      "photographer_url": "https://www.pexels.com/@marianna-15577",
      "photographer_id": 15577,
      "avg_color": "#867E7B",
      "src": {
        "original": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg",
        "large2x": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/89432/pexels-photo-89432.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Big Ben Structure Near White Concrete Structure"
    },
    {
      "id": 726484,
      "width": 2349,
      "height": 1763,
      "url": "https://www.pexels.com/photo/tower-bridge-726484/",
      "photographer": "John Smith",
      "photographer_url": "https://www.pexels.com/@manualman32",
      "photographer_id": 221705,
      "avg_color": "#7D8386",
      "src": {
        "original": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg",
        "large2x": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/726484/pexels-photo-726484.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Tower Bridge"
    },
    {
      "id": 1906879,
      "width": 4319,
      "height": 6472,
      "url": "https://www.pexels.com/photo/photo-of-person-standing-beside-barricade-1906879/",
      "photographer": "Alessio Cesario",
      "photographer_url": "https://www.pexels.com/@alessio-cesario-975080",
      "photographer_id": 975080,
      "avg_color": "#827F78",
      "src": {
        "original": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg",
        "large2x": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1906879/pexels-photo-1906879.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of Person Standing Beside Barricade"
    },
    {
      "id": 258117,
      "width": 5423,
      "height": 3622,
      "url": "https://www.pexels.com/photo/bridge-over-river-in-city-258117/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#65676B",
      "src": {
        "original": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg",
        "large2x": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/258117/pexels-photo-258117.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Bridge over River in City"
    },
    {
      "id": 1427578,
      "width": 2223,
      "height": 3321,
      "url": "https://www.pexels.com/photo/group-of-people-walking-on-bridge-1427578/",
      "photographer": "Samuel Wölfl",
      "photographer_url": "https://www.pexels.com/@samuel-wolfl-628277",
      "photographer_id": 628277,
      "avg_color": "#A8ACAE",
      "src": {
        "original": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg",
        "large2x": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Group Of People Walking On Bridge"
    },
    {
      "id": 2214035,
      "width": 4000,
      "height": 6000,
      "url": "https://www.pexels.com/photo/black-light-post-near-tree-2214035/",
      "photographer": "Timea Kadar",
      "photographer_url": "https://www.pexels.com/@timea-kadar-860778",
      "photographer_id": 860778,
      "avg_color": "#8E9686",
      "src": {
        "original": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg",
        "large2x": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/2214035/pexels-photo-2214035.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Black Light Post Near Tree"
    },
    {
      "id": 2834219,
      "width": 3909,
      "height": 4886,
      "url": "https://www.pexels.com/photo/bird-s-eye-view-of-city-during-dawn-2834219/",
      "photographer": "Pierre Blaché",
      "photographer_url": "https://www.pexels.com/@pierre-blache-651604",
      "photographer_id": 651604,
      "avg_color": "#443D48",
      "src": {
        "original": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg",
        "large2x": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Bird's Eye View Of City During Dawn"
    },
    {
      "id": 88514,
      "width": 2607,
      "height": 1824,
      "url": "https://www.pexels.com/photo/white-concrete-building-with-lights-88514/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#2F2931",
      "src": {
        "original": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg",
        "large2x": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/88514/city-building-night-view-night-88514.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "White Concrete Building With Lights"
    },
    {
      "id": 269128,
      "width": 3610,
      "height": 2407,
      "url": "https://www.pexels.com/photo/photo-of-london-eye-during-dawn-269128/",
      "photographer": "Jerome Dominici",
      "photographer_url": "https://www.pexels.com/@jdominici",
      "photographer_id": 20171,
      "avg_color": "#2A3D71",
      "src": {
        "original": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg",
        "large2x": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/269128/pexels-photo-269128.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of London Eye During Dawn "
    },
    {
      "id": 230794,
      "width": 5760,
      "height": 3840,
      "url": "https://www.pexels.com/photo/lighted-ferrys-wheel-near-body-of-water-during-nighttime-230794/",
      "photographer": "bill emrich",
      "photographer_url": "https://www.pexels.com/@bill-emrich-64742",
      "photographer_id": 64742,
      "avg_color": "#2C2534",
      "src": {
        "original": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg",
        "large2x": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/230794/pexels-photo-230794.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Lighted Ferrys Wheel Near Body of Water during Nighttime"
    },
    {
      "id": 2561281,
      "width": 2474,
      "height": 1746,
      "url": "https://www.pexels.com/photo/photo-of-london-skyline-during-golden-hour-2561281/",
      "photographer": "Miklos Magyar",
      "photographer_url": "https://www.pexels.com/@miklos-magyar-209860",
      "photographer_id": 209860,
      "avg_color": "#3E5659",
      "src": {
        "original": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg",
        "large2x": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/2561281/pexels-photo-2561281.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of London Skyline During Golden Hour"
    },
    {
      "id": 326807,
      "width": 6000,
      "height": 4000,
      "url": "https://www.pexels.com/photo/low-angle-view-of-clock-tower-against-blue-sky-326807/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#4D91CE",
      "src": {
        "original": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg",
        "large2x": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/326807/pexels-photo-326807.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Low Angle View of Clock Tower Against Blue Sky"
    },
    {
      "id": 2028885,
      "width": 3543,
      "height": 5317,
      "url": "https://www.pexels.com/photo/photo-of-water-droplets-on-glass-window-2028885/",
      "photographer": "Sid Ali",
      "photographer_url": "https://www.pexels.com/@sidali",
      "photographer_id": 1051725,
      "avg_color": "#919A95",
      "src": {
        "original": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg",
        "large2x": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of Water Droplets on Glass Window"
    },
    {
      "id": 1427579,
      "width": 3872,
      "height": 2592,
      "url": "https://www.pexels.com/photo/group-of-people-near-tower-bridge-1427579/",
      "photographer": "Samuel Wölfl",
      "photographer_url": "https://www.pexels.com/@samuel-wolfl-628277",
      "photographer_id": 628277,
      "avg_color": "#959583",
      "src": {
        "original": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg",
        "large2x": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1427579/pexels-photo-1427579.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Group of People Near Tower Bridge"
    },
    {
      "id": 280249,
      "width": 3109,
      "height": 4564,
      "url": "https://www.pexels.com/photo/grayscale-photography-of-big-ben-london-280249/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#161616",
      "src": {
        "original": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg",
        "large2x": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/280249/pexels-photo-280249.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Grayscale Photography of Big Ben, London"
    },
    {
      "id": 575362,
      "width": 3648,
      "height": 2736,
      "url": "https://www.pexels.com/photo/gray-bridge-575362/",
      "photographer": "SevenStorm JUHASZIMRUS",
      "photographer_url": "https://www.pexels.com/@sevenstormphotography",
      "photographer_id": 106219,
      "avg_color": "#82919D",
      "src": {
        "original": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg",
        "large2x": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/575362/pexels-photo-575362.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Gray Bridge"
    },
    {
      "id": 1796706,
      "width": 6000,
      "height": 3376,
      "url": "https://www.pexels.com/photo/photo-of-tower-bridge-during-dawn-1796706/",
      "photographer": "Chait Goli",
      "photographer_url": "https://www.pexels.com/@chaitaastic",
      "photographer_id": 876963,
      "avg_color": "#4A6977",
      "src": {
        "original": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg",
        "large2x": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/1796706/pexels-photo-1796706.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Photo of Tower Bridge During Dawn "
    },
    {
      "id": 788859,
      "width": 6000,
      "height": 4000,
      "url": "https://www.pexels.com/photo/glass-with-water-droplets-788859/",
      "photographer": "Nikita Khandelwal",
      "photographer_url": "https://www.pexels.com/@nikita-khandelwal-178978",
      "photographer_id": 178978,
      "avg_color": "#626454",
      "src": {
        "original": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg",
        "large2x": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/788859/pexels-photo-788859.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Glass With Water Droplets"
    },
    {
      "id": 221166,
      "width": 5472,
      "height": 3648,
      "url": "https://www.pexels.com/photo/red-telephone-booth-in-front-of-big-ben-221166/",
      "photographer": "Pixabay",
      "photographer_url": "https://www.pexels.com/@pixabay",
      "photographer_id": 2659,
      "avg_color": "#D48C8C",
      "src": {
        "original": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg",
        "large2x": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/221166/pexels-photo-221166.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Red Telephone Booth in Front of Big Ben"
    },
    {
      "id": 372038,
      "width": 5472,
      "height": 3648,
      "url": "https://www.pexels.com/photo/yellow-concrete-cathedral-under-sky-372038/",
      "photographer": "Recal Media",
      "photographer_url": "https://www.pexels.com/@recalmedia",
      "photographer_id": 7183,
      "avg_color": "#5D4C37",
      "src": {
        "original": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg",
        "large2x": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=2\u0026h=650\u0026w=940",
        "large": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=650\u0026w=940",
        "medium": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=350",
        "small": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026h=130",
        "portrait": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=1200\u0026w=800",
        "landscape": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026fit=crop\u0026h=627\u0026w=1200",
        "tiny": "https://images.pexels.com/photos/372038/pexels-photo-372038.jpeg?auto=compress\u0026cs=tinysrgb\u0026dpr=1\u0026fit=crop\u0026h=200\u0026w=280"
      },
      "liked": false,
      "alt": "Yellow Concrete Cathedral Under Sky"
    }
  ],
  "total_results": 8000,
  "next_page": "https://api.pexels.com/v1/search/?page=2\u0026per_page=30\u0026query=london"
}
""";
