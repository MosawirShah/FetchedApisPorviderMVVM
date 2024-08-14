import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_api_mvvm/services/network/base_api_services.dart';
import 'package:provider_api_mvvm/services/network/network_api_service.dart';
import 'package:provider_api_mvvm/utils/app_urls.dart';

class UploadImageRepository {
  BaseApiServices baseApiServices = NetworkApiService();

  Future<StreamedResponse> uploadImage(File imageFile) async {
    try {
      StreamedResponse response = await baseApiServices.postDataApiResponse(AppUrl.uploadImageEndPoint,imageFile);
    print("RESPONSE: ${response}");
      return response;
    } catch (e) {
      throw Exception(e.toString());
     // print(e.toString());
    }
  }
}
