
class Urls {
  static const liveURL = 'http://apptest.dokandemo.com';
  static const baseURL = '$liveURL/wp-json/';


  static const register = '${baseURL}wp/v2/users/register';
  static const login    = '${baseURL}jwt-auth/v1/token';


}
