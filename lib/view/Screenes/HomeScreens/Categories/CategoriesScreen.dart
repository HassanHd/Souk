import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/controllers/ControllerCategory.dart';

import '../../../../constant.dart';
class CategoriesScreen extends GetWidget<ControllerCategory>{
  final ControllerCategory c =Get.put(ControllerCategory());

  @override
  Widget build(BuildContext context) {
  return GetBuilder<ControllerCategory>(builder: (controller)=>Scaffold(
    body: SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85),
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          itemCount:controller.listDataModel.length,

          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              // focusColor: primarycolor,
              highlightColor: primarycolor,
              // hoverColor: Colors.red,
              onTap: () {


                print("Clicked grid item");
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.1),
                      style: BorderStyle.solid,
                      width: 0.5),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 72,
                      height: 67,
//            decoration: BoxDecoration(
//                shape: BoxShape.circle, color: identifyColor(index)),
                      child: CachedNetworkImage(
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        imageUrl: "https://www.srcform.com/image/category/"+controller.listDataModel[index].image ,
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                      //child: CircleAvatar(
                      //              radius: 48,
                      //              backgroundImage: AssetImage("images/img_${index + 1}.jpg"),
                      //            ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Text(
                        controller.listDataModel[index].name_en,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            );
          // return ListTile(
          //   title:Text(controller.listDataModel[index].name_ar),
          // );
        },),
      ),
    ),
  ) ,);
  }

}
