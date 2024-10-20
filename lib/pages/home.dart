import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List wallpaperImage = [
    "images/car.jpg",
    "images/spider.jpg",
    "images/water.jpg"
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "images/boy.jpg",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60.0,
                ),
                Text(
                  "WallWonders",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                IconButton(
                  onPressed: () {
                    Get.offAll(SignInPage());
                  },
                  icon: Icon(Icons.logout_rounded),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            CarouselSlider.builder(
              itemCount: wallpaperImage.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallpaperImage[index];
                return buildImage(res, index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1.5,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: buildIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect: SlideEffect(
          dotWidth: 15,
          dotHeight: 15,
          activeDotColor: Colors.blue,
        ),
      );

  Widget buildImage(String urlImage, int index) => Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            )),
      );
}
