import 'dart:ffi';

import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_theme_data.dart';
import 'package:e_commerce_app/app/controller_binder.dart';
import 'package:e_commerce_app/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/email_varification_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce_app/features/cart/ui/screens/cart_list_screen.dart';
import 'package:e_commerce_app/features/category/ui/screens/category_list_screen.dart';
import 'package:e_commerce_app/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_app/features/product/ui/screens/create_reviews_screen.dart';
import 'package:e_commerce_app/features/product/ui/screens/product_details_screen.dart';
import 'package:e_commerce_app/features/product/ui/screens/reviews_screen.dart';
import 'package:e_commerce_app/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../features/product/ui/screens/product_list_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      color: AppColors.themeColor,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = SplashScreen();
        } else if (settings.name == EmailVarificationScreen.name) {
          widget = EmailVarificationScreen();
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = CompleteProfileScreen();
        } else if (settings.name == OtpVarificationScreen.name) {
          widget = OtpVarificationScreen();
        } else if (settings.name == MainBottomNavBarScreen.name) {
          widget = MainBottomNavBarScreen();
        } else if (settings.name == HomeScreen.name) {
          widget = HomeScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        } else if (settings.name == ProductDetailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(id: productId);
        }else if (settings.name == CartListScreen.name) {
          widget = CartListScreen();
        }else if (settings.name == ReviewsScreen.name) {
          widget = ReviewsScreen();
        }else if (settings.name == CreateReviewsScreen.name) {
          widget = CreateReviewsScreen();
        }
        return MaterialPageRoute(builder: (context) => widget);
      },
      initialRoute: SplashScreen.name,
    );
  }
}
