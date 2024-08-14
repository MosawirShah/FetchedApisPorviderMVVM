import 'package:provider_api_mvvm/model/flags_model.dart';
import 'package:provider_api_mvvm/services/network/base_api_services.dart';
import 'package:provider_api_mvvm/services/network/network_api_service.dart';

import '../utils/app_urls.dart';

class FlagsRepository{

  BaseApiServices baseApiServices = NetworkApiService();

  Future<dynamic> fetchFlagsApi()async{
    dynamic response = await baseApiServices.getGetApiResponse(AppUrl.flagsEndPoint);
    return FlagsModel.fromJson(response);
  }
}