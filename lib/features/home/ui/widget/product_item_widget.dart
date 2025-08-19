import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                color: AppColors.themeColor.withOpacity(0.10),
              ),
              child: Image.asset(
                'assets/images/nike_shoe.png',
                width: 90,
              ),
            ),
            Column(
              children: [
                Text(
                  'Nike shoe latest edition JF494949',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black54,
                  ),
                ),
              ],

            ),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$100',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Wrap(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(
                      '4.9',
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Icon(Icons.favorite_border,size: 18,color: Colors.white,),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}