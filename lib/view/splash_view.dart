import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/services/manager/session_manager.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';
import 'package:provider_api_mvvm/view_model/user_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SessionManager().sessionManager(context);
   //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppUtils.flutterSpinkKitLoader(kPrimaryColor),
            const SizedBox(height: 30,),
            const Text("Warmly Welcome You",style: TextStyle(fontSize: 30,color: kPrimaryColor)),
          ],
        ),
      ),
    );
  }
}
