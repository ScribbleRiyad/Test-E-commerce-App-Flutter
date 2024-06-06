

import 'local_data.dart';

class ProfileData {
   static getUserData() async {

      await LocalData.getIsLoggedIn();
      await LocalData.getUserEmail();
      await LocalData.getUserName();
      await LocalData.getUserToken();
      print(await LocalData.getIsLoggedIn());
      print(await LocalData.getUserEmail());
      print(await LocalData.getUserName());
      print(await LocalData.getUserToken());


   }
}