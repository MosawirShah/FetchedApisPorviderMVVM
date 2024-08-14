import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
class AppUtils{

  //FLutter Spink kit
  static flutterSpinkKitLoader(Color color){
    return SpinKitThreeBounce(
      color: color,
      size: 40,
    );
  }

  //Rating of the movies list api but unfortunatly i m not using that api.
  static double findAverageRating(List<int> rating){
    var averageRating = 0;
    for(int i = 0; i<rating.length; i++){
      averageRating = averageRating + rating[i];
    }
    return double.parse((averageRating/rating.length).toStringAsFixed(1));
  }

  //TextFormField FocusNode
  static focusNodeChange(BuildContext context, FocusNode currentNode, FocusNode nextNode){
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  //Flutter Toast
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message.toString(),
      backgroundColor: Colors.black,
      textColor: Colors.white
    );
  }
  //FlushBar
 static flushBarErrorMessage({required String message, required BuildContext context}){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      backgroundColor: kRedColor,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.bounceInOut,
      margin:  const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      positionOffset: 20,
      borderRadius: BorderRadius.circular(20),
      flushbarPosition: FlushbarPosition.TOP,
      title: "Error",
      titleSize: 30,
      // icon: Icon(icon, size: 30,color: Colors.red,),
      duration: const Duration(seconds: 4),
    )..show(context));
 }

 //snackBar
 static snakBarMessage(String message,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message.toString()),backgroundColor: Colors.red,));
 }
}