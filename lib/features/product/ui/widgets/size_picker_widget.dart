import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({
    super.key,
    required this.sizes,
    this.defaultSelected,
    this.onSelected,
  });

  final List<String> sizes;
  final String? defaultSelected;
  final Function(String)? onSelected;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.defaultSelected ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: getSizeItems()),
    );
  }

  List<Widget> getSizeItems() {
    return widget.sizes.map((size) {
      return getSizeItemWidget(
        size: size,
        onTap: () {
          setState(() {
            _selectedSize = size;
          });
          if (widget.onSelected != null) {
            widget.onSelected!(size);
          }
        },
        isSelected: _selectedSize == size,
      );
    }).toList();
  }

  Widget getSizeItemWidget({
    required String size,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.themeColor : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.themeColor : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
