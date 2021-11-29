import 'package:flutter/material.dart';
import 'package:souk/controllers/helperCart.dart';
import 'package:souk/view/Screenes/HomeScreens/Categories/ProductDescription.dart';


import '../../constant.dart';
import 'custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  String image;
  String name;
  String reqular_price;
  String sale_price;
  String id;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
                builder: (context) => new ProductDescription(id)))
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(3, 2),
                  blurRadius: 7)
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child:     Hero(
                    tag: "Heroimg",
                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width/3,
                    ),
                  )),
            ),
            CustomText(
              text: "$name",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            Text(
       "\$$reqular_price",
              maxLines: 1,
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 9,
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
            // CustomText(
            //   text: "\$$sale_price",
            //   color: Colors.grey,
            // ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomText(
                    text: "\$$sale_price",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {


                      HelperCart().insertdb({
                        'product_id':id,
                        'name':name,
                        'quantity':1,
                        'price':(sale_price==null)?reqular_price:sale_price,
                        'path_image':image
                      }).then((value) {

                        print("inserted Cart Successfully:$value");
                      });
                      // cartController.addProductToCart(product);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleProductWidget({
    required this.image,
    required this.name,
    required this.reqular_price,
    required this.sale_price,
    required this.id,
  });
}