import 'package:flutter/foundation.dart';
import 'package:provider_api_mvvm/repository/tv_shows_repository.dart';
import 'package:provider_api_mvvm/services/response/api_response.dart';

import '../model/tv_shows_list_model.dart';

class TvShowsViewModel with ChangeNotifier{

  final _homeRepository = TvShowsRepository();

  ApiResponse<TvShowsListModel> tvShowsList = ApiResponse.loading();

  setMovieList(ApiResponse<TvShowsListModel> response){
    tvShowsList = response;
    notifyListeners();
  }

  Future<void> getMoviesList()async{
    setMovieList(ApiResponse.loading());
    _homeRepository.getMoviesList().then((value){
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}