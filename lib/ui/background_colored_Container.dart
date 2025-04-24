import 'package:kulture/utils/extensions/colors_extension.dart';
import 'package:flutter/material.dart';

class BackgroundColoredContainer extends StatelessWidget {
  const BackgroundColoredContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.primaryColor,
              context.secondaryColor,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
