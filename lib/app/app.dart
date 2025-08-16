import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_theme_data.dart';
import 'package:e_commerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/email_varification_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      color: AppColors.themeColor,
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name : (context) => SplashScreen(),
        EmailVarificationScreen.name: (context) => EmailVarificationScreen(),
        OtplVarificationScreen.name : (context) => OtplVarificationScreen(),

      },
    );
  }
}
