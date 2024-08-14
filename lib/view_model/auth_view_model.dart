import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/model/user_model.dart';
import 'package:provider_api_mvvm/repository/auth_repository.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/view_model/user_view_model.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{

  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading =>_loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  //LOGIN USER
  Future<dynamic> loginUserApi({dynamic data})async {
   try{
     setLoading(true);
     final response = await _authRepo.loginUserApi(data);
     setLoading(false);
     return response;
   }catch (e){
     setLoading(false);
     throw Exception(e.toString());
   }
  }

  //SIGNUP USER
  Future<dynamic> signUpUserApi({dynamic data})async {
   try{
     setLoading(true);
     final response = await _authRepo.signUpUserApi(data);
     setLoading(false);
     return response;
   }catch (e){
     setLoading(false);
     throw Exception(e.toString());
   }
  }


}