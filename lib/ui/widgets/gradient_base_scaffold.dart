import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class GradientBaseScaffold extends StatelessWidget {
  const GradientBaseScaffold({
    super.key,
    required this.body,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
  });

  final Widget body;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: Styles.scaffoldGradient,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Scaffold(
            key: key,
            appBar: appBar,
            drawer: drawer,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                child: body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
