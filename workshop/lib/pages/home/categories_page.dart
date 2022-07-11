import 'package:flutter/material.dart';

import '../../widgets/grid_view_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          GridView.count(
        crossAxisCount: 1 + (constraints.maxWidth / 300).round(),
        shrinkWrap: true,
        children: const [
          GridViewItem(
            icon: Icons.list_alt_outlined,
            text: "Lista",
            route: "/list",
          ),
          GridViewItem(
            icon: Icons.laptop_chromebook,
            text: "Webview",
            route: "/webview",
          ),
          GridViewItem(
            icon: Icons.gps_fixed,
            text: "GPS",
            route: "/gps",
          ),
          GridViewItem(
            icon: Icons.photo_camera,
            text: "Camera",
            route: "/gps",
          ),
        ],
      ),
    );
  }
}
