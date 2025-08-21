import 'package:e_commerce_app/features/product/ui/screens/create_reviews_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  static String name = '/reviews-screen';

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
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
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white54,
                              radius: 16,
                              child: Icon(Icons.person, color: Colors.black54),
                            ),
                            SizedBox(width: 4,),
                            Text('Remon Sheikh',style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 8,),
                        Column(
                          children: [
                            Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised.''',
                            style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black54
                            ),
                              maxLines: 4,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          buildAddReviewSection()
        ],
      ),
    );
  }
  Widget buildAddReviewSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Reviews(100)',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, CreateReviewsScreen.name);
            },
            child: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.themeColor,
                child: Icon(Icons.add,color: Colors.white,),
              ),
          ),
        ],
      ),
    );
  }
}
