
import 'package:get/get.dart';

import 'LoginControler.dart';

class binding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => LoginControler());

  }


}