import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/features/product/ui/screens/reviews_screen.dart';
import 'package:e_commerce_app/features/product/ui/widgets/color_picker_widget.dart';
import 'package:e_commerce_app/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:e_commerce_app/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:e_commerce_app/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final int id;
  static const String name = '/product-deteails-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar:
        AppBar(
          title: Text(
            'Product Details',
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselSlider(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Nike shoe TF3892 - Happy new year Spaical deal save 30%',
                                      style: textTheme.titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        Wrap(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              '4.9',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, ReviewsScreen.name);
                                          },
                                          child: Text(
                                            'Reviews',
                                            style: TextStyle(
                                              color: AppColors.themeColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: AppColors.themeColor,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              ProductQuantityIncDecButton(onChange: (int) {}),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text('Color', style: textTheme.titleMedium),
                          SizedBox(height: 8),
                          ColorPickerWidget(
                            colors: [
                              Colors.black,
                              AppColors.themeColor,
                              Colors.brown,
                              Colors.white,
                              Colors.grey,
                            ],
                          ),
                          SizedBox(height: 16),
                          Text('Size', style: textTheme.titleMedium),
                          SizedBox(height: 8),
                          SizePickerWidget(
                            sizes: ['X', 'XL', '2L', 'X'],
                            defaultSelected: 'XL',
                          ),
                          SizedBox(height: 24),
                          Text('Description', style: textTheme.titleMedium),
                          SizedBox(height: 8),
                          Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildAddToCartSection(),
          ],
        ),
    );
  }

  Widget buildAddToCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$1,000',
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
            child: ElevatedButton(onPressed: () {}, child: Text('Add To Cart')),
          ),
        ],
      ),
    );
  }
}
