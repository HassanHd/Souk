import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:souk/controllers/productDisControler.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';

class ProductDescription extends StatefulWidget {
String id;

ProductDescription(this.id);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
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
        actions: [
          IconButton(
            onPressed: () {
              // NavigationService.instance.navigationKey!.currentState!
              //     .pushReplacementNamed(
              //   "CartPageView",
              // );
            },
            icon:
                // (Cardchack == null) ? Icon(Icons.shopping_bag_outlined,color: primarycolor,)
                //     :
                new Stack(children: <Widget>[
              new Icon(
                Icons.shopping_bag_outlined,
                color: primarycolor,
              ),
              new Positioned(
                // draw a red marble
                top: 0.0,
                right: 0.0,

                child: new Icon(Icons.brightness_1,
                    size: 9.0, color: primarycolor),
              )
            ]),
            // Icon(
            //   Icons.shopping_bag_outlined,
            //   size: 18,
            //   color: primarycolor,
            // ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ProductDisControler.fetchoproductDis(widget.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.hasData)
              ?

          SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "Heroimg",
                  child: CachedNetworkImage(
                    // height: 80,
                    fit: BoxFit.cover,
                    imageUrl:"https://www.srcform.com/image/product/"+snapshot.data["main_image"],
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.shade100,
                        style: BorderStyle.solid,
                        width: 0.5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 50,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${snapshot.data["slug"]}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: textcolor),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "${snapshot.data["reqular_price"]} AED",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight:
                                        FontWeight.w800,
                                        decorationColor:
                                        primarycolor,
                                        decorationStyle:
                                        TextDecorationStyle
                                            .solid,
                                        decoration:
                                        TextDecoration
                                            .lineThrough,
                                        color: primarycolor),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "${snapshot.data["sale_price"]} AED",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: textcolor),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${snapshot.data["quantity"]}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              color: graytext),
                        ),
                      ),

                      (snapshot.data["descripation"] == null||snapshot.data["descripation"]=="null"||snapshot.data["descripation"]=="<p>null</p>")?Text(" "): Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 5.0,
                          dashColor: Colors.grey,
                          dashGapLength: 5.0,
                          dashGapColor: Colors.transparent,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: (snapshot.data["descripation"] == null||snapshot.data["descripation"]=="null"||snapshot.data["descripation"]=="<p>null</p>")?Text(
                            " "):Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: textcolor),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: (snapshot.data["descripation"] == null||snapshot.data["descripation"]=="null"||snapshot.data["descripation"]=="<p>null</p>")? Text(
                            " ")
                            : Html(
                          data: snapshot.data["descripation"],
                        ),
                        // child: Text(
                        //
                        // "${responseBody["product_description"]}",
                        // style:TextStyle(
                        // fontSize: 12,
                        // fontWeight: FontWeight.w300,
                        // color: textcolor),
                        // ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                    ],
                  ),
                )
              ],
            ),
          )

              :Center(
              child: CircularProgressIndicator(
                backgroundColor: primarycolor,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ));
        },
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(40, 0, 5, 0),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ButtonTheme(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:primarycolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),// Sets color for all the descendent ElevatedButtons
            ),
            onPressed: () {

              final snackBar = SnackBar(
                content: const Text(
                    'This product has been added to your cart.'),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(
                  context)
                  .showSnackBar(snackBar);
            },
            child: Text(
              "Add to Cart",
              style: TextStyle(color: Theme.of(context).buttonColor),
            ),
          ),
        ),
      ),
    );
  }
}
