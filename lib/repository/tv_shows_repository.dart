import 'package:provider_api_mvvm/services/network/base_api_services.dart';
import 'package:provider_api_mvvm/services/network/network_api_service.dart';
import 'package:provider_api_mvvm/utils/app_urls.dart';

import '../model/tv_shows_list_model.dart';

class TvShowsRepository{

  final BaseApiServices _apiServices = NetworkApiService();
  Future<TvShowsListModel> getMoviesList()async{

    dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesEndPointUrl);
    return TvShowsListModel.fromJson(response);
  }

}