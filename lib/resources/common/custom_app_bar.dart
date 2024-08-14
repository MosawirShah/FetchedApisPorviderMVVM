import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';
import 'package:provider_api_mvvm/utils/screen_utils.dart';
import 'package:provider_api_mvvm/view_model/user_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key,required this.title, required this.context,required this.flag,}) : super(key: key);

  String title;
  BuildContext context;
  bool flag;
  // IconData? actionIconData;
  // IconData? leadingIconData;
  // void Function()? leadingIconBtnFun;
  // void Function()? actionIconBtnFun;
  @override
  Widget build(BuildContext context) {
    final userAuthProvider = Provider.of<UserViewModel>(context);
    return AppBar(
      //leading: flag == true? IconButton(onPressed: leadingIconBtnFun, icon: Icon(leadingIconData,size: 37,color: AppColor.kWhiteColor,)) :Container(),
      title: Text(title.toString(),style: const TextStyle(color: kWhiteColor),),
      centerTitle: true,
      automaticallyImplyLeading: flag ==true ? true:false,
      backgroundColor: kPrimaryColor,
      actions: [
      //  flag==true ? IconButton(onPressed: actionIconBtnFun, icon:  Icon(actionIconData,color: AppColor.kWhiteColor,)):Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ScreenUtils.screenHeight(context) *0.1);
}
