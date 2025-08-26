import 'package:e_commerce_app/common/controller/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/common/ui/widget/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return
      PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) => _onPop(),
        child: Scaffold(
        appBar: AppBar(
          title: Text('Categories',style: TextStyle(fontSize: 20,color: Colors.black54),),
          leading: IconButton(
            onPressed: _onPop,
            icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black54,),
          ),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: CategoryItemWidget());
          },
        ),
            ),
      );
  }
  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}
