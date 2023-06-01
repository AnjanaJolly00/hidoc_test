import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  final Widget? tabBody;
  ResponsiveLayout({
    required this.mobileBody,
    required this.desktopBody,
    this.tabBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width >= 1200) {
          return desktopBody;
        }
        if (size.width < 1200 && size.width >= 600) {
          return tabBody ?? desktopBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}
