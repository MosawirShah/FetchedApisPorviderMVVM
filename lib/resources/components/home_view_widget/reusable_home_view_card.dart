import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';

class ReusableHomeViewCard extends StatelessWidget {
   ReusableHomeViewCard({Key? key,required this.title, required this.iconWidget}) : super(key: key);

  String title;
  Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: Colors.white60,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            leading: iconWidget,
            title: Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
