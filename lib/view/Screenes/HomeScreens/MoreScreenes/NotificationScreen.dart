import 'package:flutter/material.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Notification",
          color: primarycolor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primarycolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ListView(
          children: [

            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assats/images/global.png"),
                ),
                backgroundColor: primarycolor,
              ),
              title: Row(
                children: [
                  Expanded(
                    flex: 75,
                    child: CustomText(
                      text: "Lorem ipsum dolor sit amet",
                      color: black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: CustomText(
                      text: "Dec 11,2021",
                      color: graytext,
                      fontSize: 9,
                      textAlign: TextAlign.end,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              subtitle: CustomText(
                text: "consectetur adipiscing elit, sed ",
                color: graytext,
                fontSize: 15,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assats/images/global.png"),
                ),
                backgroundColor: primarycolor,
              ),
              title: Row(
                children: [
                  Expanded(
                    flex: 75,
                    child: CustomText(
                      text: "Lorem ipsum dolor sit ",
                      color: black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: CustomText(
                      text: "Dec 11,2021",
                      color: graytext,
                      fontSize: 9,
                      textAlign: TextAlign.end,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              subtitle: CustomText(
                text: "consectetur adipiscing elit,sed ",
                color: graytext,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
