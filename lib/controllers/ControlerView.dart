import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:souk/view/Screenes/HomeScreens/HomeBottomNavBar.dart';
import 'package:souk/view/Screenes/HomeScreens/HomeScreenes.dart';
import 'package:souk/view/Screenes/auth/LoginScreen.dart';

import 'LoginControler.dart';

class ControlerView extends GetWidget<LoginControler>{
  ControlerView({Key? key}) : super(key: key);
  final LoginControler loginControler =Get.put(LoginControler());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControler>(builder: (controller) =>
    Get.find<LoginControler>().id != null ? HomeBottomNavBar() : LoginScreen());
  }


  }

