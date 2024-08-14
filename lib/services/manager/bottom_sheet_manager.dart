import 'package:flutter/material.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';

import '../../resources/common/text_widget.dart';

class BottomSheetManager{

  static bottomSheetManager(BuildContext context)async{
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
    ),
    ),
    backgroundColor: kChatGptScaffoldColor,
    context: context,
    builder: (context) {
    return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
    children: [
    Flexible(child: TextWidget(label: "Chosen model: ",fontSize: 16,))
    ],
    ),
    );
    });
  }
}