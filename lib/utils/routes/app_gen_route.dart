import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/Admin/add-edit-wallpaper.dart';
import 'package:my_flutter_wallpaper/Admin/admin_home.dart';
import 'package:my_flutter_wallpaper/pages/bottomnav.dart';
import 'package:my_flutter_wallpaper/pages/login.dart';
import 'package:my_flutter_wallpaper/pages/register.dart';
import 'package:my_flutter_wallpaper/pages/splash_page.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';

import '../../Admin/list_of_wallpaper.dart';

Route<dynamic> onGenerate(RouteSettings setting) {
  switch (setting.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );

    case AppRoutes.signIn:
      return MaterialPageRoute(
        builder: (context) {
          return SignInPage();
        },
      );

    case AppRoutes.signUp:
      return MaterialPageRoute(
        builder: (context) => SignUpPage(),
      );

    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => BottomNav(),
      );

    case AppRoutes.adminHome:
      return MaterialPageRoute(
        builder: (context) => AdminHome(),
      );

    case AppRoutes.addEditWallpaper:
      var arguments = setting.arguments;
      return MaterialPageRoute(
        builder: (context) => AddEditWallpaper(
          arguments: arguments,
        ),
      );

    case AppRoutes.wallpaperList:
      var arguments = setting.arguments;

      return MaterialPageRoute(
        builder: (context) => ListOfWallpaper(
          arguments: arguments,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
  }
}
