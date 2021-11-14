import 'package:flutter/material.dart';

import '../../constant.dart';
import 'CrossPlatformSvg.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final String icons;
  var onTap;

  CustomListTile({this.text=" ", this.icons=" ", this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
          dense: true,
          leading: CrossPlatformSvg.asset(icons,width: 25,height: 25),
          title: Text("$text",style:TextStyle(color: black,fontSize: 18),),
          trailing: Icon(Icons.chevron_right,size: 25,color: gray,),
          onTap: onTap,
        ),
        Divider(
          height: 0.1,
          endIndent: 8,
          indent: 8,
          thickness: 0.2,
        ),
      ],
    );

  }

}