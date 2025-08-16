import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/app/assets_path.dart';
import 'package:e_commerce_app/features/home/ui/widget/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/app_bar_icon_button.dart';
import 'home_carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchBarTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(controller: _searchBarTEController),
              SizedBox(height: 16,),
              HomeCarouselSlider()
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navbarAppLogoSvg),
      actions: [
        AppBarIconButton(icon: Icons.person, onTap: () {}),
        SizedBox(width: 6),
        AppBarIconButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 6),
        AppBarIconButton(icon: Icons.notifications_active, onTap: () {}),
        SizedBox(width: 6),
      ],
    );
  }
}


