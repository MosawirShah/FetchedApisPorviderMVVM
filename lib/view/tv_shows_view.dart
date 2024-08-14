import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/model/tv_shows_list_model.dart';
import 'package:provider_api_mvvm/services/response/status.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/view_model/tv_shows_view_model.dart';
import 'package:provider_api_mvvm/view_model/user_view_model.dart';
import '../resources/common/custom_app_bar.dart';
import '../utils/routes/routes_name.dart';

class TvShowsView extends StatefulWidget {
  const TvShowsView({Key? key}) : super(key: key);

  @override
  State<TvShowsView> createState() => _TvShowsViewState();
}

class _TvShowsViewState extends State<TvShowsView> {
  TvShowsViewModel tvShowsViewModel = TvShowsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tvShowsViewModel.getMoviesList();
  }

  @override
  Widget build(BuildContext context) {
   // final userAuthProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
          title: 'TV SHOWS',
          context: context,
          flag: true,
         ),
      body: ChangeNotifierProvider<TvShowsViewModel>(
          create: (BuildContext context) => tvShowsViewModel,
          child: Consumer<TvShowsViewModel>(builder: (context, value, _) {
            switch (value.tvShowsList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              case Status.ERROR:
                return Center(
                    child: Text(value.tvShowsList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.tvShowsList.data!.tvShows!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            value.tvShowsList.data!.tvShows![index]
                                .imageThumbnailPath
                                .toString(),
                            errorBuilder: (context, error, stack) {
                              return const Icon(Icons.error_outline_rounded);
                            },
                          ),
                          title: Text(value
                              .tvShowsList.data!.tvShows![index].name
                              .toString()),
                          subtitle: Text(value
                              .tvShowsList.data!.tvShows![index].startDate
                              .toString()),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //Text(AppUtils.findAverageRating(value.moviesList.data!.movies[index].rating).toStringAsFixed(1)),
                              Text("5.3"),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                      );
                    });

              default:
                return Text("Noooo");
            }
          })),
    );
  }
}
