import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../Repository/Authentication/authentication_repo.dart';
import '../../Utils/local_data.dart';
import '../../Utils/profile_data.dart';
import '../../Utils/utils.dart';



final authenticationController =
ChangeNotifierProvider((ref) => AuthenticationProvider());


class AuthenticationProvider extends ChangeNotifier {

  AuthenticationRepository authenticationRepository =
  AuthenticationRepository();

  bool isLoginLoading = false;
  bool passwordVisible = true;
  bool isLoadingRegister = false;

  final textformFeildFocusNode = FocusNode();

  //----------------------------registration--------------------


  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController = TextEditingController();




  //----------------------------Login--------------------
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();



  void registration({context}) async {
    dynamic response;
    isLoadingRegister = true;
    notifyListeners();


    Map<String, dynamic> jsonData = {
      'username': nameController.text,
      'password': passwordController.text,
      'email': emailController.text,
    };


    response = await authenticationRepository.registration(data: jsonData);


    if (response.statusCode == 200)
    {

      Utils.customSnackBar(context: context, snackText: response.data['message'], snackDuration: 3);
      GoRouter.of(context).go("/loginScreen");
      isLoadingRegister = false;
      nameController.text = "";
      passwordController.text = "";
      passwordConfirmationController.text = "";
      emailController.text = "";

      notifyListeners();
    }
    else{
      Utils.customSnackBar(context: context, snackText: response.data['message'], snackDuration: 3);
      isLoadingRegister = false;
      notifyListeners();
    }


  }


  void login({context}) async {
    dynamic response;

    isLoginLoading = true;
    notifyListeners();


    Map<String, dynamic> jsonData = {
      'username': userNameController.text,
      'password': userPasswordController.text
    };


    response = await authenticationRepository.login(formData: jsonData);


      if (response.statusCode == 200)
      {

        LocalData.setIsLoggedIn(status: true);
        LocalData.setUserName(userName: response.data['user_nicename']);
        LocalData.setUserToken(userToken: response.data['token']);
        LocalData.setUserEmail(userEmail: response.data['user_email']);
        LocalData.setDisplayName(displayName: response.data['user_display_name']);
        Future.delayed(const Duration(seconds: 1), () {
          GoRouter.of(context).go("/");
          ProfileData.getUserData();
        });


          Utils.customSnackBar(context: context, snackText: "You Have Successfully Logged In", snackDuration: 3);
           isLoginLoading = false;
          userNameController.text = "";
        userPasswordController.text = "";
        notifyListeners();
      }
      else{
        isLoginLoading = false;
        notifyListeners();
      }
    }



  }

