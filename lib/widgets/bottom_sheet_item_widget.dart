import 'package:flutter/material.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final IconData icon;
  final String itemTitle;
  final Function() onTap;
  const BottomSheetItemWidget({
    Key? key,
    required this.icon,
    required this.itemTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 8),
          Text(itemTitle),
        ],
      ),
    );
  }
}
