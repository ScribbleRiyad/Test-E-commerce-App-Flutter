
import '../../main.dart';


class LocalData {
  static clearData() async {
    await box.erase();
  }


}
