import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider_api_mvvm/services/exceptions/app_exception.dart';
import 'package:provider_api_mvvm/services/network/base_api_services.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/view_model/upload_image_view_model.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future<dynamic> getGetApiResponse(String url) async{
    dynamic jsonResponse;
   try{
  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
  jsonResponse = returnApiResponse(response);
   }on SocketException{     //No Internet
     throw FetchDataException('No Internet Connection');
   }
   return jsonResponse;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async{
    dynamic jsonResponse;
    try{
      http.Response response = await http.post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));
      jsonResponse = returnApiResponse(response);
    }on SocketException{
       throw FetchDataException('No Internet Connection ');
        }
        return jsonResponse;
  }
  //Upload Image
 // UploadImageViewModel uploadImageViewModel = UploadImageViewModel();

  @override
  Future<dynamic> postDataApiResponse(String url,File imageFile)async{
    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();

    var length = await imageFile.length();
    var uri =  Uri.parse(url);

    var request =  http.MultipartRequest('POST', uri);

    request.fields['title'] = "Static title" ;

    var multipart = http.MultipartFile(
        'image',
        stream,
        length);

    request.files.add(multipart);

    var response = await request.send() ;


    if(response.statusCode == 200 || response.statusCode ==201){
      print("UPLOADED SUCCESSFULLY");

    }else{
      print("ERROR CAUGHT");
    }
  // return returnApiResponse(response);
    return response;



  }

  dynamic returnApiResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 201:
        final jsonResponse = jsonDecode(response.body);
        print(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        int statusCode = response.statusCode;
        throw FetchDataException('Error occurred while communicating with server with status code: $statusCode');
    }
  }
}