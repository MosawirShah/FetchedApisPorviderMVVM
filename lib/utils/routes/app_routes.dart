import 'package:flutter/cupertino.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';
import 'package:provider_api_mvvm/view/chat_gpt_view.dart';
import 'package:provider_api_mvvm/view/flags_view.dart';
import 'package:provider_api_mvvm/view/home_view.dart';
import 'package:provider_api_mvvm/view/tv_shows_view.dart';
import 'package:provider_api_mvvm/view/login_view.dart';
import 'package:provider_api_mvvm/view/signup_view.dart';
import 'package:provider_api_mvvm/view/upload_image_view.dart';

import '../../view/splash_view.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)>appRoutes(BuildContext context){
    return {
      RoutesName.splashView :(context) => const SplashView(),
      RoutesName.loginView : (context) => const LoginView(),
      RoutesName.signUpView : (context) => const SignUpView(),
      RoutesName.tvShowsView : (context) => const TvShowsView(),
      RoutesName.flagsView : (context) => const  FlagsView(),
      RoutesName.homeView : (context) => const HomeView(),
      RoutesName.uploadImageView : (context) => const UploadImageView(),
      RoutesName.chapgptView : (context) => const ChatGptView()
    };
  }
}