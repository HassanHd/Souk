import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souk/controllers/ControllerCategory.dart';
import 'package:souk/models/slider.dart';
import 'package:http/http.dart' as http;
import 'package:souk/view/utils/custom_text.dart';
import 'dart:convert';

import '../../../../constant.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double targetElevation = 3;
  double _elevation = 0;
  ScrollController? _controller;
  final _listViewKey = GlobalKey();
  final ControllerCategory c =Get.put(ControllerCategory());


  Future<List<slider>> _getSlider() async {
    var url = Uri.parse("https://www.srcform.com/eco/sliders");
    print(url);
    final response = await http.get(url);
    List<slider> list = [];
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body)["sliders"];
      print(responseBody);

      for (var u in responseBody) {
        slider x = slider(u["image_slider"]);
        list.add(x);
      }
      // print("Hassan------>$list");
      return list;
    } else {
      print("statusCode------>${response.statusCode}");
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Home",
          color: primarycolor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),


      ),
      body: CustomScrollView(key: _listViewKey, slivers: [
        SliverToBoxAdapter(
          child: FutureBuilder(
              future: _getSlider(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: primarycolor,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.white),
                      ));
                } else {
                  return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.5,
                        viewportFraction: 1.0,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeInToLinear,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index, Index) {
                        return Container(
                          padding: EdgeInsets.all(0),
                          child: InkWell(
                              onTap: () {
                                print("${snapshot.data[index].photo}");
                              },
                              child: Image.network(
                               "https://www.srcform.com/image/slider/${snapshot.data[index].image_slider}",
                                  fit: BoxFit.fitWidth
                              )),
                        );
                      });
                }
              }),

        ),

        SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.topLeft,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          textAlign: TextAlign.left,
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          text: "Categories",),
                        TextButton(
                          onPressed: () {
                            print("Hi");
                            // NavigationService
                            //     .instance.navigationKey!.currentState!
                            //     .pushNamed(
                            //   "CategoriesListView",
                            // );
                          },
                          child: Text(
                            "View All",
                            style: clickableCaption(context),
                          ),
                        ),
                      ],
                    ),


                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/6,
                    // color: Colors.white,
                    child: Expanded(
                        child:
    GetBuilder<ControllerCategory>(builder: (controller)=>ListView.builder(
      itemCount:controller.listDataModel.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          // focusColor: primarycolor,
          highlightColor: primarycolor,
          // hoverColor: Colors.red,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) =>
            //           ListSubCategories(
            //               snapshot.data[index]
            //                   .category_name,
            //               snapshot.data[index].id)),
            //   // MaterialPageRoute(builder: (context) => verifyAccount(email)),
            // );

            print("Clicked grid item");
          },
          child: Container(
            alignment: Alignment.center,

            height: MediaQuery.of(context).size.height/5,
            padding: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 0.5),
            ),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(1),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bordercolor),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: CachedNetworkImage(
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      imageUrl: "https://www.srcform.com/image/category/"+controller.listDataModel[index].image ,

                      errorWidget:
                          (context, url, error) =>
                          Icon(Icons.error),
                    ),

                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: Container(
                    width: 72,
                    child: Text(
                      "${controller.listDataModel[index].name_en}",
                      maxLines: 2,
                      textAlign: TextAlign.center,

                      // overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(
                          color: textcolor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

    },)

                    )
                  )

                  )
                ])
                    )
                    ),
        SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/3,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.topLeft,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: CustomText(
                      textAlign: TextAlign.left,
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      text: "Hot Deals",),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height/4,
                    child: ListView(
                      scrollDirection: Axis.horizontal,

                      children: [



                      ],
                    ),
                  )

                ]))),
      ]),
    );
  }
}
