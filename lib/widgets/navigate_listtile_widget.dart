import 'package:flutter/material.dart';
import '../common/theme.dart';

class NavigateListTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  final IconData icons;
  const NavigateListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        title,
        style: primaryTextStyle,
      ),
      trailing: Icon(
        icons,
        color: white,
        size: 30,
      ),
    );
  }
}
