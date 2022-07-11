import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const GridViewItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
              size: 70,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
