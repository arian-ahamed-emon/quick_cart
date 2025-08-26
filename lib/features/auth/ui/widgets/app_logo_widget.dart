
import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.appLogo,width: 220,);
  }
}
