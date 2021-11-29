// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../constant.dart';
// import 'Cart/CartScreen.dart';
// import 'Categories/CategoriesScreen.dart';
// import 'Home/HomeScreen.dart';
// import 'MoreScreenes/MoreScreen.dart';
// class HomeScreenes extends StatefulWidget {
//   const HomeScreenes ({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenesState createState() => _HomeScreenesState();
// }
//
// class _HomeScreenesState extends State<HomeScreenes > {
//   int _selectedIndex = 0;
//   String? Cardchack;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   Future<void> chack() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       Cardchack = prefs.getString("Cardchack");
//       print("Cardchack----->$Cardchack");
//     });
//   }
//   Future<void> setuuid() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var chickuuid=prefs.getString("uuid");
//     if(chickuuid==null){
//       // var status = await OneSignal.shared.getDeviceState();
//       // String? onesignalUserId = status!.userId;
//       // var uuidlogin = onesignalUserId.toString();
//       // prefs.setString("uuid", uuidlogin);
//     }
//   }
//
//   @override
//   void initState() {
//     chack();
//     setuuid();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onBackPressed,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: [
//           HomeScreen(),
//           CategoriesScreen(),
//           CartScreen(),
//           MoreScreen()
//         ].elementAt(_selectedIndex),
//         bottomNavigationBar: BottomNavigationBar(
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined),
//               title: Text(
//                 'Home',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.widgets_outlined),
//               title: Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//
//             BottomNavigationBarItem(
//               icon:  Icon(Icons.shopping_bag_outlined),
//               title: Text(
//                 'Cart',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               title: Text(
//                 'More',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//           ],
//           backgroundColor: white,
//           elevation: 5,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _selectedIndex,
//           selectedItemColor: primarycolor,
//           unselectedItemColor: textcolor,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
//
//   Future<bool> _onBackPressed() async {
//     return await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm'),
//           content: Text('Do you want to exit the App'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('No'),
//               onPressed: () {
//                 Navigator.of(context).pop(false); //Will not exit the App
//               },
//             ),
//             FlatButton(
//               child: Text('Yes'),
//               onPressed: () => exit(0),
//
//               // onPressed: () {
//               //   // onPressed: ()=> exit(0),
//               //
//               //   // Navigator.of(context).pop(true); //Will exit the App
//               // },
//             )
//           ],
//         );
//       },
//     ) ??
//         false;
//   }
// }
//
