import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key, required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none
      ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          prefixIcon: Icon(Icons.search,color:Colors.grey,),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey
          )
      ),
    );
  }
}