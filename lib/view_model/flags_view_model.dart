import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/model/flags_model.dart';
import 'package:provider_api_mvvm/repository/flags_repository.dart';
import 'package:provider_api_mvvm/services/response/api_response.dart';

class FlagsViewModel with ChangeNotifier{

  final _flagsRepo = FlagsRepository();

  ApiResponse<FlagsModel> flagsApiResponse = ApiResponse.loading();

  setCountryFlag(ApiResponse<FlagsModel> flagsRes){
    flagsApiResponse = flagsRes;
    notifyListeners();
  }

  Future<void> getCountryFlag() async{
    setCountryFlag(ApiResponse.loading());
    _flagsRepo.fetchFlagsApi().then((value) {
      setCountryFlag(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setCountryFlag(ApiResponse.error(error.toString()));
    });
  }
}