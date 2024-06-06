import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../Repository/Profile/profile_repo.dart';
import '../../Utils/local_data.dart';



final profileScreenController =
ChangeNotifierProvider((ref) => ProfileScreenProvider());

class ProfileScreenProvider extends ChangeNotifier {
  ProfileRepository profileRepository = ProfileRepository();
  dynamic userName, token,email ;

 bool isUpdateProfileLoading = false;
 final textformFeildFocusNode = FocusNode();
  //----------------------------registration--------------------

  TextEditingController updateFirstName = TextEditingController();
  TextEditingController updateLastName = TextEditingController();





  void getProfileLocalData() async{
    userName = await LocalData.getUserName();
    email = await LocalData.getUserEmail();
    token = await LocalData.getUserToken();
    print(token);

    notifyListeners();
  }





  void updateProfileData({context}) async {
    dynamic response;
    isUpdateProfileLoading = true;
    notifyListeners();


    Map<String, dynamic> jsonData = {
      'first_name': updateFirstName.text,
      'last_name': updateLastName.text,
    };


    response = await profileRepository.updateProfileData(data: jsonData, token: token );
    print(response.statusCode);


    if (response.statusCode == 200)
    {






        GoRouter.of(context).go("/applicationScreen");


      // Utils.customSnackBar(context: context, snackText: response.data['message'], snackDuration: 3);
      isUpdateProfileLoading = false;
      updateFirstName.clear();
      updateLastName.clear();
      notifyListeners();
    }
    else{
      // Utils.customSnackBar(context: context, snackText: response.data['message'], snackDuration: 3);
      isUpdateProfileLoading = false;
      notifyListeners();
    }


  }





  void logout({context}) {
    LocalData.setIsLoggedIn(status: false);
    LocalData.clearData();
    GoRouter.of(context).go("/");

  }


}