import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget with PreferredSizeWidget {
  final Color color;
  final String text;

  const ProductAppBar({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.2,
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: color,
          ),
        )
      ],
    );
  }
}
