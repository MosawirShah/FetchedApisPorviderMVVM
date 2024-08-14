import 'package:flutter/cupertino.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';

import '../../view_model/user_view_model.dart';

class SessionManager{
  Future<void> sessionManager(BuildContext context)async{
    await UserViewModel().checkAuthentication().then((value)async{
      if(value.token == 'null' || value.token == ''){
        await Future.delayed(const Duration(seconds: 3),(){
          Navigator.of(context).pushNamed(RoutesName.loginView);
        });
      }else{
        await Future.delayed(const Duration(seconds: 3),(){
          Navigator.of(context).pushNamed(RoutesName.homeView);
        });

      }
    });
  }
}