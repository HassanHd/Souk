
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:souk/view/Screenes/auth/LoginScreen.dart';
import 'package:souk/view/utils/CrossPlatformSvg.dart';
import 'package:souk/view/utils/custom_listtile.dart';
import 'package:souk/view/utils/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant.dart';
import 'AboutASC.dart';
import 'DataPolicyScreen.dart';
import 'FAQScreen.dart';
import 'NotificationScreen.dart';
import 'SupportScreen.dart';
import 'TermsScreen.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "More",
          color: primarycolor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: butcolor,
        //     size: 35,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(

          children: [
            CustomListTile(text: "About ASC",icons: "assats/icons/info.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return AboutASC();
                }));
              },
            ),
            CustomListTile(text: "Change Language",icons: "assats/icons/translation.svg",),
            CustomListTile(text: "Notifications",icons: "assats/icons/bell.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return NotificationScreen();
                }));
              },
            ),
            CustomListTile(text: "Share App",icons: "assats/icons/share.svg",
              onTap: () {
                Share.share(
                    'Download ASC app at https://play.google.com/store/apps/details?id=com.allsportscourts.optimalsolutions');
              },

            ),
            CustomListTile(text: "Data Policy",icons: "assats/icons/secure.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return DataPolicyScreen();
                }));
              },
            ),
            CustomListTile(text: "Terms & Conditions",icons: "assats/icons/terms-and-conditions.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return TermsScreen();
                }));
              },
            ),
            CustomListTile(text: "Rate Us",icons: "assats/icons/star.svg",

              onTap: (){
                opinurl("https://play.google.com/store/apps/details?id=com.allsportscourts.optimalsolutions");
              },
            ),
            CustomListTile(text: "FAQ",icons: "assats/icons/faq.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return FAQScreen();
                }));
              },
            ),
            CustomListTile(text: "Support",icons: "assats/icons/suport.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return SupportScreen();
                }));
              },
            ),

            CustomListTile(text: "Logout",icons: "assats/icons/logout.svg",

              onTap: () async {
                // SharedPreferences preferences =
                // await SharedPreferences.getInstance();
                // await preferences.clear();
                Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return LoginScreen();
                    },
                  ),
                      (_) => false,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            CustomText(text:"V1.0.0",color: primarycolor,textAlign: TextAlign.center,fontWeight: FontWeight.bold,fontSize: 21,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (){
                        opinurl("https://www.facebook.com/optimalsolutionscorp");
                      }
                      ,child: CrossPlatformSvg.asset("assats/icons/facebooklogo.svg",width: 30,height: 30)),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: (){
                        opinurl("https://www.instagram.com/optimalsolutionscorp/");
                      },
                      child: CrossPlatformSvg.asset("assats/icons/instagram.svg",width: 30,height: 30)),
                ],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/20,),






          ],
        ),
      ),
    );
  }
  void opinurl(String url)async {
    var urllanch=url;
    if(await canLaunch(urllanch)){
      await launch(urllanch);
    }else{
      await launch(urllanch);
    }
  }
}
