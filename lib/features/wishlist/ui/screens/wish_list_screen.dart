
import 'package:e_commerce_app/common/controller/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/features/wishlist/ui/widgets/wish_list_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common/ui/widget/product_item_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
      _onPop();
      },
      child: Scaffold(
       appBar:
       AppBar(
          title: Text(
            'Wish List',
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          leading: IconButton(
            onPressed: () {
            _onPop();
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount:10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4
            ),
            itemBuilder: (context, index) {
              return  FittedBox(child: WishListProductItemWidget());
            },
          ),
        ),
      ),
    );
  }
  void _onPop() {
    Get.find<MainBottomNavController>().changeIndex(0);
  }
}
