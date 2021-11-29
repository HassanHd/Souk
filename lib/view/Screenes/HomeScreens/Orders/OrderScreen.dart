import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souk/view/utils/CustomButton.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
import 'DiscriptionOrder.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Orders",
          color: primarycolor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: primarycolor,
        //     size: 35,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 2.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Text("",style: TextStyle(color:textcolor ),),
                            Text(
                              // "#${snapshot.data[i].id}",
                              "# 165",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: RichText(
                              text: TextSpan(
                                // style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Icon(
                                        Icons.delivery_dining,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Paiding",
                                    // (
                                    //     snapshot.data[i].deliveryStatus ==
                                    //         "Pending")
                                    //     ? "Pending".tr().toString()
                                    //     : "Paid",
                                    style: TextStyle(
                                      color: primarycolor,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    // Text("${snapshot.data[i].product}",style: TextStyle(color:black ),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date:",
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              // "${snapshot.data[i].datetime}",
                              "12/5/2021",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                // style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Icon(
                                        Icons.monetization_on_outlined,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        // (snapshot.data[i].paymentStatus ==
                                        //         "Pending")
                                        //     ? "Pending".tr().toString()
                                        //     : "Paid".tr().toString(),
                                        "Pending",
                                    style: TextStyle(
                                      color: primarycolor,
                                    ),
                                  ),

                                  // TextSpan(text: "${snapshot.data[i].paymentStatus}",style: TextStyle(color:primarydarkcolor ),),
                                ],
                              ),
                            )),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              // "${snapshot.data[i].total} AED",
                              "25 AED",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: CustomButton(
                            text: "Reorder",
                            color: primarycolor,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ReorderScreen(
                              //         orderId: snapshot.data[i].id,
                              //       )),
                              // );
                            },
                          ),
                        )
                        // (snapshot.data[i].paymentStatus == "Pending")
                        //     ? Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: CustomButton(
                        //           text: "pay now".tr().toString(),
                        //           color: primarycolor,
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       paymentwebapp(snapshot.data[i].id)),
                        //             );
                        //           },
                        //         ),
                        //       )
                        //     : Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: CustomButton(
                        //           text: "Reorder".tr().toString(),
                        //           color: primarycolor,
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => ReorderScreen(
                        //                         orderId: snapshot.data[i].id,
                        //                       )),
                        //             );
                        //           },
                        //         ),
                        //       ),
                      ],
                    ),
                    Divider(
                      color: gray,
                      height: 2,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return DiscriptionOrder();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 2.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Text("",style: TextStyle(color:textcolor ),),
                            Text(
                              // "#${snapshot.data[i].id}",
                              "# 165",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: RichText(
                              text: TextSpan(
                                // style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Icon(
                                        Icons.delivery_dining,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Paiding",
                                    // (
                                    //     snapshot.data[i].deliveryStatus ==
                                    //         "Pending")
                                    //     ? "Pending".tr().toString()
                                    //     : "Paid",
                                    style: TextStyle(
                                      color: primarycolor,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    // Text("${snapshot.data[i].product}",style: TextStyle(color:black ),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date:",
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              // "${snapshot.data[i].datetime}",
                              "12/5/2021",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                // style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Icon(
                                        Icons.monetization_on_outlined,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        // (snapshot.data[i].paymentStatus ==
                                        //         "Pending")
                                        //     ? "Pending".tr().toString()
                                        //     : "Paid".tr().toString(),
                                        "Pending",
                                    style: TextStyle(
                                      color: primarycolor,
                                    ),
                                  ),

                                  // TextSpan(text: "${snapshot.data[i].paymentStatus}",style: TextStyle(color:primarydarkcolor ),),
                                ],
                              ),
                            )),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              // "${snapshot.data[i].total} AED",
                              "25 AED",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: CustomButton(
                            text: "Reorder",
                            color: primarycolor,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ReorderScreen(
                              //         orderId: snapshot.data[i].id,
                              //       )),
                              // );
                            },
                          ),
                        )
                        // (snapshot.data[i].paymentStatus == "Pending")
                        //     ? Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: CustomButton(
                        //           text: "pay now".tr().toString(),
                        //           color: primarycolor,
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       paymentwebapp(snapshot.data[i].id)),
                        //             );
                        //           },
                        //         ),
                        //       )
                        //     : Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: CustomButton(
                        //           text: "Reorder".tr().toString(),
                        //           color: primarycolor,
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => ReorderScreen(
                        //                         orderId: snapshot.data[i].id,
                        //                       )),
                        //             );
                        //           },
                        //         ),
                        //       ),
                      ],
                    ),
                    Divider(
                      color: gray,
                      height: 2,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 2.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Text("",style: TextStyle(color:textcolor ),),
                            Text(
                              // "#${snapshot.data[i].id}",
                              "#165",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: RichText(
                              text: TextSpan(
                                // style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Icon(
                                        Icons.delivery_dining,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Paiding",
                                    // (
                                    //     snapshot.data[i].deliveryStatus ==
                                    //         "Pending")
                                    //     ? "Pending".tr().toString()
                                    //     : "Paid",
                                    style: TextStyle(
                                      color: primarycolor,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    // Text("${snapshot.data[i].product}",style: TextStyle(color:black ),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date:",
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              // "${snapshot.data[i].datetime}",
                              "12/5/2021",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                // style: Theme.of(context).textTheme.body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Icon(
                                        Icons.monetization_on_outlined,
                                        color: primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    // (snapshot.data[i].paymentStatus ==
                                    //         "Pending")
                                    //     ? "Pending".tr().toString()
                                    //     : "Paid".tr().toString(),
                                    "Pending",
                                    style: TextStyle(
                                      color: primarycolor,
                                    ),
                                  ),

                                  // TextSpan(text: "${snapshot.data[i].paymentStatus}",style: TextStyle(color:primarydarkcolor ),),
                                ],
                              ),
                            )),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(color: textcolor),
                            ),
                            Text(
                              // "${snapshot.data[i].total} AED",
                              "25 AED",
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: CustomButton(
                            text: "Reorder",
                            color: primarycolor,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ReorderScreen(
                              //         orderId: snapshot.data[i].id,
                              //       )),
                              // );
                            },
                          ),
                        )
                        // (snapshot.data[i].paymentStatus == "Pending")
                        //     ? Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: CustomButton(
                        //           text: "pay now".tr().toString(),
                        //           color: primarycolor,
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       paymentwebapp(snapshot.data[i].id)),
                        //             );
                        //           },
                        //         ),
                        //       )
                        //     : Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: CustomButton(
                        //           text: "Reorder".tr().toString(),
                        //           color: primarycolor,
                        //           onPressed: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => ReorderScreen(
                        //                         orderId: snapshot.data[i].id,
                        //                       )),
                        //             );
                        //           },
                        //         ),
                        //       ),
                      ],
                    ),
                    Divider(
                      color: gray,
                      height: 2,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
