import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/login.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(SignInPage());
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text('Admin Home page'),
        ),
      ),
    );
  }
}
