import 'package:flutter/material.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
class AboutASC extends StatelessWidget {
  const AboutASC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "About ASC",
          color: primarycolor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primarycolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child:ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
              alignment: Alignment.center,
              child: CustomText(
                text:
                "Plan your game is our most interesting service. As a user you can book the court most convenient for you and invite other players using our website or app. They can confirm or decline and you can manage the game status as the game planner. ",
                fontSize: 16,
                color: black,
                textAlign:TextAlign.center ,
                fontWeight: FontWeight.bold,
                // alignment: Alignment.center,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
