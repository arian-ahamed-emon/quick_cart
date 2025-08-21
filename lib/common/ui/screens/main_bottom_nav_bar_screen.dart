import 'package:e_commerce_app/app/app_colors.dart';
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
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartListScreen(),
    const WishListScreen(),
  ];

  final List<IconData> _iconPaths = [
    Icons.home,
    Icons.category,
    Icons.shopping_cart,
    Icons.favorite_border,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_iconPaths.length, (index) {
                bool isSelected = bottomNavController.selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    bottomNavController.changeIndex(index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 6,),
                      Icon(
                        _iconPaths[index],
                        size: 30,
                        color: isSelected ? AppColors.themeColor : Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ['Home', 'Categories', 'Cart', 'Wish'][index],
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.teal : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
