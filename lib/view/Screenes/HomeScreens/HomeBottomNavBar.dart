
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souk/controllers/helperCart.dart';
import 'package:souk/view/utils/CrossPlatformSvg.dart';

import '../../../constant.dart';
import 'Cart/CartScreen.dart';
import 'Categories/CategoriesScreen.dart';
import 'Home/HomeScreen.dart';
import 'MoreScreenes/MoreScreen.dart';
import 'Orders/OrderScreen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  _HomeBottomNavBarState createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  PersistentTabController? _controller;
  String? Cardchack;
  Future<void> chack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Cardchack = prefs.getString("Cardchack");
      print("Cardchack----->$Cardchack");
    });
  }
  @override
  void initState() {
    chack();
    HelperCart().db.then((value){
      print("value $value");
    });
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      OrderScreen(),
      MoreScreen()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: "Home",

        activeColorPrimary: primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.widgets_outlined),
        title: "Categories",
        activeColorPrimary: primarycolor,
        inactiveColorPrimary:Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart,color:Colors.white,size: 30,),
        title: " ",

        activeColorPrimary:primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.work_outline_outlined),
        title: "Orders",

        activeColorPrimary:primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: "More",

        activeColorPrimary:primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 60,
      backgroundColor: white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,

      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(2.0),
        colorBehindNavBar: Colors.grey,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOutCubic,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.easeInOutCubic,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
