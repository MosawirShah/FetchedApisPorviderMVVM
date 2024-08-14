import 'package:flutter/material.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/screen_utils.dart';

class RoundButton extends StatelessWidget {
  RoundButton({super.key, required this.title, this.loading = false, required this.onTapButton});
  String title;
  bool loading;
  void Function() onTapButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapButton,
      child: Container(
        height: ScreenUtils.screenHeight(context) * 0.07,
        width: ScreenUtils.screenWidth(context) * 0.4,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: loading == true ? const CircularProgressIndicator(
            color: kWhiteColor,
          ):Text(title.toString(),style: const TextStyle(color: kWhiteColor),),
        ),
      ),
    );
  }
}
