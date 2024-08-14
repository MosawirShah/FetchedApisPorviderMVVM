import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/resources/common/custom_app_bar.dart';
import 'package:provider_api_mvvm/services/response/status.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';
import 'package:provider_api_mvvm/utils/screen_utils.dart';
import 'package:provider_api_mvvm/view_model/flags_view_model.dart';
import 'package:provider_api_mvvm/view_model/user_view_model.dart';

class FlagsView extends StatefulWidget {
  const FlagsView({Key? key}) : super(key: key);

  @override
  State<FlagsView> createState() => _FlagsViewState();
}

class _FlagsViewState extends State<FlagsView> {
  FlagsViewModel flagsViewModel = FlagsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flagsViewModel.getCountryFlag();
  }

  @override
  Widget build(BuildContext context) {
    final userAuthProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
          title: 'COUNTRIES FLAG',
          context: context,
          flag: true,
         ),
      body: ChangeNotifierProvider<FlagsViewModel>(
        create: (context) => flagsViewModel,
        child: Consumer<FlagsViewModel>(
          builder: (context, value, _) {
            switch (value.flagsApiResponse.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(
                    color:     kPrimaryColor,
                  ),
                );
              case Status.ERROR:
                return Center(
                  child: Text(value.flagsApiResponse.message.toString()),
                );
              case Status.COMPLETED:
                return GridView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: value.flagsApiResponse.data!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          color: Colors.white60,
                          child:
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.stretch,
                                   children: [
                                     SvgPicture.network(
                                       height: 150,
                                        width: 100,
                                        fit: BoxFit.fill,
                                        value
                                        .flagsApiResponse.data!.data[index].flag
                                        .toString(),
                                     ),
                                     Container(
                                       color: Colors.black,
                                       height: 30,
                                         width: 100,
                                         child: Center(child: Text(value
                                             .flagsApiResponse.data!.data[index].name
                                             .toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),))),
                                   ],
                                 ),

                              // SizedBox(height:10),
                            //  Text(value.flagsApiResponse.data!.data[index].name.toString()),
                                            ///
                        ),
                      );
                    });
              default:
                return const Text("Default");
            }
          },
        ),
      ),
    );
  }
}
