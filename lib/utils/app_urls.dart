class AppUrl{

  //LOGIN/SIGNUP base URL
  static const baseUrl = 'https://reqres.in/';

  //Movies base URL
  static const moviesBaseUrl = 'https://www.episodate.com/api/';

  //Flags base URL
  static const flagsBaseUrl = 'https://countriesnow.space/api/v0.1/countries/flag/';

  //Upload images base URL
  static const uploadImageBaseURL = 'https://fakestoreapi.com/';

  ///END POINTS
  //LOGIN/SIGNUP END POINT
  static const loginEndPoint = '${baseUrl}api/login';
  static const registerEndPoint = '${baseUrl}api/register';

  //MOVIES ENDPOINT URL
  static const moviesEndPointUrl = '${moviesBaseUrl}most-popular?page=1';

  //Flags end point URL
  static const flagsEndPoint = '${flagsBaseUrl}images';

  //UPLOAD IMAGE THROUGH POST API END POINT
  static const uploadImageEndPoint = '${uploadImageBaseURL}products';

}