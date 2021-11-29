import 'package:flutter/material.dart';
import 'package:souk/models/CartItemModel.dart';

import 'custom_text.dart';


class CartItemWidget extends StatelessWidget {
  late final CartItemModel cartItem;



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Image.network(
            "https://www.srcform.com/image/product/1634816489.jpg",
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 14),
                    child: CustomText(
                      text: "cartItem.name",
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                            Icons.chevron_left),
                        onPressed: () {
                          // cartController.decreaseQuantity(cartItem);
                        }),
                    Padding(
                      padding:
                      const EdgeInsets.all(
                          8.0),
                      child: CustomText(
                        text: "5",
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons
                            .chevron_right),
                        onPressed: () {
                          // cartController.increaseQuantity(cartItem);
                        }),
                  ],
                )
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: CustomText(
            text: "\$20}",
            fontWeight:FontWeight.bold ,
            fontSize:22 ,

          ),
        ),
      ],
    );
  }
}