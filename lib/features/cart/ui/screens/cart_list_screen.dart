import 'package:e_commerce_app/app/assets_path.dart';
import 'package:e_commerce_app/common/controller/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../app/app_colors.dart';
import '../widgets/cart_product_widget.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  static const String name = '/cart-list-screen';

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _canPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          leading: IconButton(
            onPressed: () {
              _canPop();
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartProductWidget();
                },
              ),
            ),
            buildCheckoutSection(),
          ],
        ),
      ),
    );
  }

  void _canPop() {
    Get.find<MainBottomNavController>().changeIndex(0);
  }
}



Widget buildCheckoutSection() {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'Total Price',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '\$100,000',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.themeColor,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 120,
          child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
        ),
      ],
    ),
  );
}
