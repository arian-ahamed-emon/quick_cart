import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_theme_data.dart';
import 'package:e_commerce_app/app/controller_binder.dart';
import 'package:e_commerce_app/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/email_varification_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce_app/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      color: AppColors.themeColor,
      initialBinding: ControllerBinder(),
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        EmailVarificationScreen.name: (context) => EmailVarificationScreen(),
        CompleteProfileScreen.name: (context) => CompleteProfileScreen(),
        OtpVarificationScreen.name: (context) => OtpVarificationScreen(),
        MainBottomNavBarScreen.name: (context) => MainBottomNavBarScreen(),
        HomeScreen.name: (context) => HomeScreen(),
      },
    );
  }
}
