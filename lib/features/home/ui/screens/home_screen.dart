import 'package:e_commerce_app/app/assets_path.dart';
import 'package:e_commerce_app/features/home/ui/widget/category_item_widget.dart';
import 'package:e_commerce_app/features/home/ui/widget/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/app_bar_icon_button.dart';
import '../widget/home_carousel_slider.dart';
import '../widget/home_section_header.dart';
import '../widget/product_item_widget.dart';

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
              SizedBox(height: 16),
              HomeCarouselSlider(),
              SizedBox(height: 16),
              HomeSectionHeader(title: 'Category', onTap: () {}),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getCategoryList()),
              ),
              SizedBox(height: 16),
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductList()),
              ),
              SizedBox(height: 16),
              HomeSectionHeader(title: 'Spacial', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductList()),
              ),
              SizedBox(height: 16),
              HomeSectionHeader(title: 'New', onTap: () {}),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductList()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CategoryItemWidget(),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ProductItemWidget(),
        ),
      );
    }
    return productList;
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
