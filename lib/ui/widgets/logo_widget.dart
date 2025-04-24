import 'package:flutter/material.dart';

import '../../constants/asset_paths.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPaths.pngLogo,
      width: 140,
      height: 38,
    );
  }
}
