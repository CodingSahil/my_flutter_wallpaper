import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_flutter_wallpaper/pages/register.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';

import '../utils/colors.dart';

const kPrimaryColor = Color(0xFF6F35A5);

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 64),
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: SvgPicture.asset('images/login.svg'),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          onSaved: (email) {},
                          decoration: const InputDecoration(
                            hintText: "Your email",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(16),
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            cursorColor: kPrimaryColor,
                            decoration: const InputDecoration(
                              hintText: "Your password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(16),
                                child: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                              context,
                              AppRoutes.home,
                            );
                          },
                          child: Text(
                            "Login".toUpperCase(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: Stack(
    //     children: [
    //       BackgroundWidget(),
    //       Column(
    //         children: [
    //           SizedBox(
    //             height: 300.h,
    //           ),
    //           Text("Sign In",
    //               style: TextStyle(
    //                   fontFamily: "mont",
    //                   fontSize: 35,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold)),
    //           Text("Lorem ipsum dolar sit amet",
    //               style: TextStyle(
    //                   fontFamily: "mont",
    //                   fontSize: 20,
    //                   color: pinkColor,
    //                   fontWeight: FontWeight.bold)),
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    //             child: SignInBody(),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(vertical: 20.h),
    //             child: HaveAccountWidget(haveAccount: false),
    //           )
    //         ],
    //       ),
    //       Positioned(
    //         left: 60.w,
    //         right: 60.w,
    //         top: 630.h,
    //         child: CustomBtn(
    //             text: "Sign In",
    //             color: pinkColor,
    //             onTap: () => Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => NavigationPage()))),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 64),
          Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: SvgPicture.asset(
                  'images/signup.svg',
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 8,
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        onSaved: (email) {},
                        decoration: const InputDecoration(
                          hintText: "Your email",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(16),
                            child: Icon(Icons.person),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: kPrimaryColor,
                          decoration: const InputDecoration(
                            hintText: "Your password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(16),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16 / 2),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Sign Up".toUpperCase()),
                      ),
                      const SizedBox(height: 16),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignInPage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
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
