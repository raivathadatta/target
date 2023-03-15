import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class AdhikariProfileController extends GetxController {
  RxBool isSwitched = false.obs;
  RxString textValue = 'Switch is OFF'.obs;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      isSwitched.value = true;
      textValue.value = 'Switch Button is ON';

      print('Switch Button is ON');
    } else {
      isSwitched.value = false;
      textValue.value = 'Switch Button is OFF';

      print('Switch Button is OFF');
    }
  }
}
