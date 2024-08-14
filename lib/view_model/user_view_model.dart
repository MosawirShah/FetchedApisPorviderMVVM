import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_api_mvvm/model/user_model.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  //CHECK USER AUTHENTICATION
  Future<dynamic> checkAuthentication()async{
    //UserModel userModel;
    final checkSession = getUser();
    return checkSession;
  }

  //SET DATA
 Future<bool> saveUser(UserModel userModel)async{
   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString('token', userModel.token.toString());
   notifyListeners();
   return true;
 }

 //GET DATA
 Future<UserModel> getUser()async{
   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   final String? token = sharedPreferences.getString('token');
   return UserModel(token: token.toString());
 }

 //LOG OUT USER
Future<void> removeUser() async{
   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.remove('token');
}
}