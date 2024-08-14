import 'package:provider_api_mvvm/model/user_model.dart';
import 'package:provider_api_mvvm/services/network/base_api_services.dart';
import 'package:provider_api_mvvm/services/network/network_api_service.dart';
import 'package:provider_api_mvvm/utils/app_urls.dart';

class AuthRepository{

  BaseApiServices apiServices = NetworkApiService(); //Polymorphism and generic code which can easily extensible and modifiable.

  //Login User
  Future<dynamic> loginUserApi(dynamic data) async{
    try{
      dynamic response = apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }
        catch(e){
        throw Exception(e.toString());
        }
  }

  //Register User
  Future<dynamic> signUpUserApi(dynamic data) async{
    try{
      dynamic response = apiServices.getPostApiResponse(AppUrl.registerEndPoint,data);
      return response;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}