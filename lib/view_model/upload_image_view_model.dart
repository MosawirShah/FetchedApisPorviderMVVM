import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_api_mvvm/repository/upload_image_repository.dart';

import '../services/response/api_response.dart';

class UploadImageViewModel with ChangeNotifier{

  final _imageRepository = UploadImageRepository();
 // ApiResponse<UploadImageViewModel> imageUploader = ApiResponse.loading();

  File? _imageFile;
  get imageFile => _imageFile;
  ImagePicker imagePicker = ImagePicker();

  Future<void> pickImageFromGallery()async{
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    _imageFile =  File(pickedImage!.path);
     notifyListeners();
  }


 // Set Loader
  bool _loading = false;
  get loading => _loading;
  setLoader(bool val){
    _loading = val;
    notifyListeners();
  }

  ApiResponse<UploadImageViewModel> imageUploader = ApiResponse.loading();

  setMovieList(ApiResponse<UploadImageViewModel> response){
    imageUploader = response;
    notifyListeners();
  }

  Future<dynamic> uploadImage()async{
   try{
     setLoader(true);
     StreamedResponse response = await _imageRepository.uploadImage(imageFile);
     setLoader(false);
     return response;
   }catch(e){
     setLoader(false);
     throw Exception(e.toString());
   }
  }

  }
