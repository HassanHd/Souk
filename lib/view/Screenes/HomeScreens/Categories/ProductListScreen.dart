import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/controllers/ControllerProductList.dart';
import 'package:souk/view/utils/SingleProductWidget.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';

class ProductListScreen extends GetWidget<ControllerProductList> {
  int id;
  String name;

  ProductListScreen(this.id, this.name) {
    c.fetchProductList(id).then((value) => c.update());
  }

  final ControllerProductList c = Get.put(ControllerProductList());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerProductList>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // centerTitle: true,
          title: CustomText(
            text: "$name",
            color: primarycolor,
            fontSize: 22,
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
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 4.0,
                childAspectRatio: .63,
              ),
              padding: const EdgeInsets.all(10),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: BouncingScrollPhysics(),
              itemCount: controller.listDataModel.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleProductWidget(
                    image:
                        "https://www.srcform.com/image/product/${controller.listDataModel[index].main_image}",
                    name: controller.listDataModel[index].name,
                    reqular_price:
                        controller.listDataModel[index].reqular_price,
                    sale_price: controller.listDataModel[index].sale_price,
                  id: controller.listDataModel[index].id.toString(),);
                // return ListTile(
                //   title:Text(controller.listDataModel[index].name_ar),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
