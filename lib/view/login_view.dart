import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_mvvm/model/user_model.dart';
import 'package:provider_api_mvvm/resources/common/custom_app_bar.dart';
import 'package:provider_api_mvvm/resources/common/round_button.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';
import 'package:provider_api_mvvm/utils/constants/text_styles.dart';
import 'package:provider_api_mvvm/utils/routes/routes_name.dart';
import 'package:provider_api_mvvm/utils/screen_utils.dart';
import 'package:provider_api_mvvm/view_model/auth_view_model.dart';

import '../view_model/user_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

 // Color? obsecureColor;
 // Color? emailPrefixIconColor =    kPrimaryColor;
 // Color? passwordPrefixIconColor =    kPrimaryColor;

 @override
  void dispose() {
    // TODO: implement dispose
   _emailController.dispose();
   _passwordController.dispose();

   emailFocusNode.dispose();
   passwordFocusNode.dispose();

   obsecurePassword.dispose();
   print("Ram is destructed");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   //Provider
    final authProvider = Provider.of<AuthViewModel>(context);
    double screeHeight = ScreenUtils.screenHeight(context);
    double screenWidth = ScreenUtils.screenWidth(context);
    return Scaffold(
      appBar: CustomAppBar(title: "Login User",context: context,flag: false,),
      body: SafeArea(
        child: SizedBox(
          width: screenWidth * 0.95,
          child: Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  focusNode: emailFocusNode,
                  decoration:  InputDecoration(
                    hintText: 'Email',
                    hintStyle: kHintStyle,
                    label: Text('Email',style: kLabelStyle,),
                    prefixIcon: const Icon(Icons.email_outlined,color:    kPrimaryColor,),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),

                  onFieldSubmitted: (value) {
                    AppUtils.focusNodeChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
                const SizedBox(height: 30,),
                //Password Field
                ValueListenableBuilder(
                    valueListenable: obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        focusNode: passwordFocusNode,
                        obscuringCharacter: '*',
                        obscureText: obsecurePassword.value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: kHintStyle,
                            label:  Text('Password',style: kLabelStyle,),
                            prefixIcon: const Icon(Icons.password,color:    kPrimaryColor,),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            suffixIcon: InkWell(
                              onTap: (){
                                obsecurePassword.value = !obsecurePassword.value;
                              },
                                child: Icon(value == true? Icons.visibility_off: Icons.visibility,color: value == true ?    kLightWhiteColor :   kPrimaryColor,))),
                      );
                    }),
                SizedBox(
                  height: screeHeight * 0.09,
                ),
                //Button
                RoundButton(title: "Login User",loading: authProvider.loading, onTapButton: (){
                  if(_emailController.text.isEmpty){
                    AppUtils.flushBarErrorMessage(message: 'Please Enter Your Email Address',context: context, );
                  }
                  else if(_passwordController.text.isEmpty){
                    AppUtils.flushBarErrorMessage(message: 'Please Enter Your Password',context: context, );
                  }else if(_passwordController.text.length<6){
                    AppUtils.flushBarErrorMessage(message: 'Please 6-digit Password',context: context,);
                  }else{
                    Map data = {
                      "email": _emailController.text,
                      "password": _passwordController.text
                    };
                    authProvider.loginUserApi(data: data).then((value){
                      ///NEW ADDED CODE
                      final userPreferences = Provider.of<UserViewModel>(context,listen: false);
                      userPreferences.saveUser(UserModel.fromJson(value));
                      AppUtils.toastMessage('SignIn successfully');
                      Navigator.of(context).pushNamed(RoutesName.tvShowsView);
                      if(kDebugMode){
                        print(value.toString());
                      }
                      ///
                    }).onError((error, stackTrace){
                     // setLoading(false);
                      AppUtils.flushBarErrorMessage(context: context,message: error.toString());
                      if(kDebugMode){
                        print(error.toString());
                      }
                    });;

                  }

                },),
                SizedBox(
                  height: screeHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(RoutesName.signUpView);
                    }, child: const Text("Sign Up",style:TextStyle(
                      color:    kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    )))
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
