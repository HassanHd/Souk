import 'package:flutter/material.dart';
import 'package:souk/view/utils/CustomButton.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';

class DiscriptionOrder extends StatelessWidget {
  const DiscriptionOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Your order",
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
        padding: const EdgeInsets.only(top: 40.0,left: 5,right: 5),
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2),
                        child: Text(
                          "# 156",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        )),
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          "25/5/2021",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        )),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Delivery Status",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600,
                              color: textcolor),
                        )
                    ),
                  ],
                )

            ),

            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Payment Status",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600,
                              color: textcolor),
                        )
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Payment Type",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                    Spacer(flex: 2),
                    Expanded(
                        flex: 4,
                        // alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.height,
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "cash on delivery",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        )),
                  ],
                )),
            SizedBox(height: 10),
            Divider(
              color: gray,
              height: 0,
              indent: 70,
              endIndent: 70,
              thickness: 0.7,
            ),

            // Container(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: 10),
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         physics: ScrollPhysics(),
            //         itemCount: snapshot.data.length,
            //         itemBuilder: (context, i) {
            //           return Row(
            //             crossAxisAlignment:
            //             CrossAxisAlignment.center,
            //             mainAxisAlignment:
            //             MainAxisAlignment
            //                 .spaceBetween,
            //             children: [
            //               Container(
            //                   child: Text(
            //                     "${snapshot.data[i].name}" +
            //                         " ("
            //                             "${snapshot.data[i].quantity}" +
            //                         ")",
            //                     style: TextStyle(
            //                         fontSize: 20,
            //                         fontWeight:
            //                         FontWeight.w800,
            //                         color: Colors.black),
            //                   )),
            //               Container(
            //                   padding:
            //                   EdgeInsets.symmetric(
            //                       horizontal: 10),
            //                   child: Text(
            //                     "AED ${snapshot.data[i].total_price}",
            //                     style: TextStyle(
            //                         fontSize: 16,
            //                         fontWeight:
            //                         FontWeight.w600,
            //                         color: textcolor),
            //                   )),
            //             ],
            //           );
            //         })),
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Container(
                        child: Text(
                          "250ML" +
                              " ("+"Pack of 30"+")"+"(6)",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                              FontWeight.w800,
                              color: Colors.black),
                        )),
                    Container(
                        padding:
                        EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          "AED 60",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w600,
                              color: textcolor),
                        )),
                  ],
                )),

            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Row(
            //       crossAxisAlignment:CrossAxisAlignment.center ,
            //       mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            //       children: [
            //         Container(
            //           // alignment: Alignment.center,
            //           // width: MediaQuery.of(context).size.height,
            //           // padding: EdgeInsets.symmetric(horizontal: 50),
            //             child: Text(
            //               "datetime".tr().toString(),
            //               style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.w800,
            //                   color: Colors.black),                                      )),
            //         Container(
            //           // alignment: Alignment.center,
            //           // width: MediaQuery.of(context).size.height,
            //             padding: EdgeInsets.symmetric(horizontal: 10),
            //             child: Text(
            //               "$date",
            //               style: TextStyle(
            //                   fontSize: 16, fontWeight: FontWeight.w600,color: textcolor),
            //             )),
            //       ],
            //     )
            // ),

            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Shipping",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          "AED 35",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        )),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 2.5),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Tax (%5)",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                    Container(
                      // alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          "AED 20",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textcolor),
                        )),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 5),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context)
                            .size
                            .height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50),
                        child: Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context)
                            .size
                            .height,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50),
                        child: Text(
                          "AED 650",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: primarycolor),
                        )),
                  ],
                )),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 40,
                    width: MediaQuery.of(context)
                        .size
                        .width / 2 - 40,

                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomButton(
                      text:
                      "invoice",
                      color: primarycolor,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => invoicesScreen(widget.id)
                        //   ),
                        // );
                        // _fun.opinurl(
                        //     "https://hopewater.co/crm_new/orders/send_pdf_invoice/${widget.id}");
                        //_fun.opinurl("https://enos.itcollege.ee/~jpoial/oop/naited/Clean%20Code.pdf");
                      },
                    )),
                Container(
                    height: 40,
                    width: MediaQuery.of(context)
                        .size
                        .width /
                        2 -
                        40,
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomButton(
                      text:
                      "Reorder",
                      color: primarycolor,
                      onPressed: () {
                        // NavigationService.instance.navigationKey.currentState
                        //     .pushNamed(
                        //   "Payment",
                        // );
                        // addorder();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           ReorderScreen(
                        //             orderId:
                        //             widget.id,
                        //           )),
                        // );
                      },
                    ))
              ],
            )
            // (paymentStatus != "Pending")
            //     ?
            //     : Text(" "),
            // SizedBox(height: 10),
            // (paymentStatus == "Pending")
            //     ? Container(
            //     height: 40,
            //     width:
            //     MediaQuery.of(context).size.width,
            //     padding: EdgeInsets.symmetric(
            //         horizontal: 20),
            //     child: CustomButton(
            //       text: "pay now",
            //       color: primarycolor,
            //       onPressed: () {
            //         // NavigationService.instance.navigationKey.currentState
            //         //     .pushNamed(
            //         //   "Payment",
            //         // );
            //         // addorder();
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) =>
            //                   paymentwebapp(
            //                       widget.id)),
            //         );
            //       },
            //     ))
            //     : Text(" "),
           , SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
