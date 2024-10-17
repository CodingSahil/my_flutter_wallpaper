// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // BackgroundWidget(),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Text("Register",
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: SignUpBody(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: HaveAccountWidget(haveAccount: true),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 60.w,
                  right: 60.w,
                  top: 625.h,
                  child: CustomBtn(
                      text: "Register", color: pinkColor, onTap: () {})),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // double sizeHeight = MediaQuery.of(context).size.height;
    // double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 460.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
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
                      Icons.person_sharp,
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
                    labelText: "Full Name",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
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
                      Icons.mobile_friendly,
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
                    labelText: "Mobile Number",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
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
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
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
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
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
                    labelText: "Confirm Password",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}