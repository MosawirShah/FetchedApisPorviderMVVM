import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider_api_mvvm/resources/common/custom_app_bar.dart';
import 'package:provider_api_mvvm/resources/components/home_view_widget/reusable_home_view_card.dart';
import 'package:provider_api_mvvm/services/manager/asset_manager.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'PICK ANY API',
        flag: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RoutesName.tvShowsView);
            },
            child: ReusableHomeViewCard(
              iconWidget: const Icon(
                Icons.movie,
                color: kPrimaryColor,
                size: 30,
              ),
              title: "TV SHOWS",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RoutesName.flagsView);
            },
            child: ReusableHomeViewCard(
              iconWidget: const Icon(
                Icons.flag_circle_rounded,
                color: kPrimaryColor,
                size: 30,
              ),
              title: "COUNTRIES FLAG",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RoutesName.uploadImageView);
            },
            child: ReusableHomeViewCard(
              iconWidget: const Icon(
                Icons.image,
                color:      kPrimaryColor,
                size: 30,
              ),
              title: "UPLOAD IMAGES",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RoutesName.chapgptView);
            },

            child: ReusableHomeViewCard(
              iconWidget: Image(
                image: AssetImage(
                  AssetManager.chatGptLogo,
                ),
                height: 30,
                width: 30,
              ),
              title: "CHAT GPT",
            ),
          ),
        ],
      ),
    );
  }
}
