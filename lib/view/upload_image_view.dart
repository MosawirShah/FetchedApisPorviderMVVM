import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/resources/common/custom_app_bar.dart';
import 'package:provider_api_mvvm/resources/common/round_button.dart';
import 'package:provider_api_mvvm/services/response/status.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/screen_utils.dart';
import 'package:provider_api_mvvm/view_model/upload_image_view_model.dart';

class UploadImageView extends StatefulWidget {
  const UploadImageView({Key? key}) : super(key: key);

  @override
  State<UploadImageView> createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
  // UploadImageViewModel uploadImageViewModel = UploadImageViewModel();
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<UploadImageViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'UPLOAD IMAGE',
        flag: true,
      ),
      body: ChangeNotifierProvider<UploadImageViewModel>(
        create: (BuildContext context) => UploadImageViewModel(),
        child: SizedBox(
          height: ScreenUtils.screenHeight(context),
          width: ScreenUtils.screenWidth(context),
          //color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  value.pickImageFromGallery();
                },
                child: Container(
                  child: value.imageFile == null
                      ? const Center(child: Text("Upload Image"))
                      : Stack(
                    alignment: AlignmentDirectional.center,
                          children: [
                            SizedBox(
                              height: ScreenUtils.screenHeight(context) * 0.5,
                              width: ScreenUtils.screenWidth(context) * 0.8,
                              child: Image.file(
                                File(value.imageFile!.path).absolute,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Center(child: value.loading == true ? AppUtils.flutterSpinkKitLoader(kWhiteColor):Container()),
                          ],
                        ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RoundButton(
                title: "UPLOAD",
                onTapButton: () async {
                  StreamedResponse response = await value.uploadImage();
                  if(response.statusCode == 200 || response.statusCode == 201){
                    AppUtils.toastMessage("IMAGE UPLOADED SUCCESSFULLY");
                  }else{
                    AppUtils.flushBarErrorMessage(message: "ERROR OCCURED", context: context);
                  }
                  // switch(value.imageUploader.status){
                  //   // case Status.LOADING:
                  //   //   AppUtils.toastMessage('loading ...');
                  //   case Status.ERROR:
                  //      AppUtils.flushBarErrorMessage(message: value.imageUploader.message.toString(), context: context);
                  //   case Status.COMPLETED:
                  //    await value.uploadImage();
                  //    print("api hitted");
                  //     AppUtils.toastMessage('Image Uploaded');
                  //   default:
                  // }
                },
                loading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
