import 'package:flutter/material.dart';

import '../../constant.dart';


class CustomButton extends StatelessWidget {

  final String text;
   var onPressed;
  final Color color;



  CustomButton({required this.text, required this.onPressed,this.color=primarycolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  FlatButton(onPressed:onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(5),
          color:color ,
          child: Text(text,style: TextStyle(color: white,fontSize: 15,fontWeight:FontWeight.w800 ),)

      ),
    );
  }
}