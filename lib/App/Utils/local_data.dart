
import '../../main.dart';
import 'constants.dart';


class LocalData {
  static clearData() async {
    await box.erase();
  }
  static setIsLoggedIn({status}) async {
    await box.write(Constants.isLoggedIn, status);
  }

  static getIsLoggedIn() async {
    return box.read(Constants.isLoggedIn);
  }
  static setUserName({userName}) {
    return box.write(Constants.username, userName);
  }

  static getUserName() async {
    return box.read(Constants.username);
  }
  static setUserEmail({userEmail}) {
    return box.write(Constants.email, userEmail);
  }

  static getUserEmail() async {
    return box.read(Constants.email);
  }
  static setDisplayName({displayName}) {
    return box.write(Constants.displayName, displayName);
  }

  static getDisplayName() async {
    return box.read(Constants.displayName);
  }
  static setUserToken({userToken}) {
    return box.write(Constants.token, userToken);
  }

  static getUserToken() async {
    return box.read(Constants.token);
  }
}
