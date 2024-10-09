import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_wallpaper/pages/register.dart';

import '../utils/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackgroundWidget(),
          Column(
            children: [
              SizedBox(
                height: 300.h,
              ),
              Text("Sign In",
                  style: TextStyle(
                      fontFamily: "mont",
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text("Lorem ipsum dolar sit amet",
                  style: TextStyle(
                      fontFamily: "mont",
                      fontSize: 20,
                      color: pinkColor,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SignInBody(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: HaveAccountWidget(haveAccount: false),
              )
            ],
          ),
          Positioned(
            left: 60.w,
            right: 60.w,
            top: 630.h,
            child: CustomBtn(
                text: "Sign In",
                color: pinkColor,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationPage()))),
          ),
        ],
      ),
    );
  }
}

class NavigationPage extends StatefulWidget {
  NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late PageController _pageController;

  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  Widget page(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
            fontFamily: "mont",
            fontWeight: FontWeight.bold,
            color: blackColor,
            fontSize: 35),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.search,
                color: pinkColor,
                size: 35,
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.app_registration_outlined,
              size: 35,
              color: pinkColor,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                // HomePage(),
                page("Favorite Page"),
                page("Profile Page"),
                page("Settings Page"),
              ],
            ),
            // Bottom Navigation
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
              child: Container(
                decoration: BoxDecoration(
                    color: pinkColor, borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  child: CupertinoTabBar(
                      border: const Border(top: BorderSide(color: pinkColor)),
                      backgroundColor: pinkColor,
                      currentIndex: pageIndex,
                      inactiveColor: Colors.white,
                      onTap: onTap,
                      activeColor: blackColor,
                      // inactiveColo r: Colors.grey,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.favorite),
                        ),
                        BottomNavigationBarItem(icon: Icon(Icons.person)),
                        BottomNavigationBarItem(icon: Icon(Icons.settings)),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: sizeWidth * 1,
      height: sizeHeight * 1,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/wp.png",
              ),
              fit: BoxFit.cover)),
    );
  }
}

class CustomBtn extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onTap;

  CustomBtn(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80)),
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ]),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(text,
              style: TextStyle(
                  fontFamily: "mont",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600))),
    );
  }
}

class HaveAccountWidget extends StatelessWidget {
  bool haveAccount;

  HaveAccountWidget({
    super.key,
    required this.haveAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
                haveAccount
                    ? "Already have an account? "
                    : "Don't have an account? ",
                style: TextStyle(
                    fontFamily: "mont",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.9))),
          ),
          TextButton(
            onPressed: () => haveAccount
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ))
                : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  )),
            child: Text(haveAccount ? "Sign In" : "Sign Up",
                style: const TextStyle(
                  fontFamily: "mont",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: pinkColor,
                )),
          )
        ],
      ),
    );
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // double sizeHeight = MediaQuery.of(context).size.height;
    // double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 270.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                height: 60.h,
                width: double.infinity - 20.w,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    color: greyColor),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Center(
                  child: TextFormField(
                    cursorColor: pinkColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: pinkColor.withOpacity(.5),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 16.sp,
                          color: blackColor.withOpacity(
                            0.5,
                          ),
                          fontFamily: "mont",
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      labelText: "Email",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                height: 60.h,
                width: double.infinity - 20.w,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    color: greyColor),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Center(
                  child: TextFormField(
                    cursorColor: pinkColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: pinkColor.withOpacity(.5),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 16.sp,
                          color: blackColor.withOpacity(
                            0.5,
                          ),
                          fontFamily: "mont",
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      labelText: "Password",
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: pinkColor.withOpacity(0.5),
                    fontFamily: "mont",
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
