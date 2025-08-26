import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/assets_path.dart';
import 'package:e_commerce_app/common/controller/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/features/cart/ui/screens/cart_list_screen.dart';
import 'package:e_commerce_app/features/category/ui/screens/category_list_screen.dart';
import 'package:e_commerce_app/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_app/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = '/main-navbar';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  final List<String> _imagePath = [
    AssetsPath.bottomNavHomeIcon,
    AssetsPath.bottomNavCategoryIcon,
    AssetsPath.bottomNavCartIcon,
    AssetsPath.bottomNavWishListIcon,
  ];

  final List<String> _labels = ['Home', 'Categories', 'Cart', 'Wish'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavController.selectedIndex,
            onTap: (index) {
              bottomNavController.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            selectedItemColor: AppColors.themeColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: List.generate(_imagePath.length, (index) {
              return BottomNavigationBarItem(
                icon: Image.asset(
                  _imagePath[index],
                  height: 26,
                  width: 26,
                  color: Colors.grey,
                ),
                activeIcon: Image.asset(
                  _imagePath[index],
                  width: 28,
                  height: 28,
                  color: AppColors.themeColor,
                ),

                label: _labels[index],
              );
            }),
          ),
        );
      },
    );
  }
}
