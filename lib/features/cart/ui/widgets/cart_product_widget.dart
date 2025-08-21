import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../product/ui/widgets/product_quantity_inc_dec_button.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4 ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.dummyProductImage,
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 8,),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Nike Shoe - ZF192 Latest Edition New Year Spacial Deal',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 18, overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Text('Color: Black',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 16),),
                                SizedBox(width: 8,),
                                Text('Size: XL',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 16),),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$100',style: TextStyle(
                          fontSize: 18,
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w500
                      ),),
                      ProductQuantityIncDecButton(
                        onChange: (p0) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}