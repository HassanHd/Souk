import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souk/constant.dart';
import 'package:souk/controllers/helperCart.dart';

import 'custom_text.dart';


class CartItem extends StatelessWidget {
   String path_image;
   String productId;
   double price;
   int quantity;
   String name;

  CartItem({required this.path_image, required this.productId, required this.price, required this.quantity, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Dismissible(
        key: ValueKey(productId),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(15),
          ),
          // color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (innerContext) => AlertDialog(
              title: Text('Are you sure!'),
              content: Text('Do you want to remove the cart item?'),
              actions: <Widget>[
                FlatButton(child: Text('No'), onPressed: (){
                  Navigator.of(innerContext).pop(false);
                },),
                FlatButton(child: Text("Yes"), onPressed: (){
                  HelperCart().deleteProduct(productId).then((value) {
                    print("delet suc");
                    Navigator.of(innerContext).pop(true);

                  });

                },)
              ],
            ),
          );
        },
        onDismissed: (direction) {
          // if(direction == DismissDirection.endToStart) {
          // Provider.of<Cart>(context, listen: false).removeItem(productId);
          // }
        },
child: Row(
  children: [
      SizedBox(
        width: 88,
        child: AspectRatio(
          aspectRatio: 0.88,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(path_image),
          ),
        ),
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 16),
            maxLines: 2,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "\$${price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: primarycolor),
                  children: [
                    TextSpan(
                        text: " x${quantity}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/5),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                          Icons.chevron_left),
                      onPressed: () {
                        quantity++;
                        // cartController.decreaseQuantity(cartItem);
                      }),
                  Padding(
                    padding:
                    const EdgeInsets.all(
                        8.0),
                    child: CustomText(
                      text: quantity.toString(),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons
                          .chevron_right),
                      onPressed: () {
                        quantity--;

                        // cartController.increaseQuantity(cartItem);
                      }),
                ],
              )
            ],
          ),

        ],
      )
  ],
),
          // child: Row(
          //   mainAxisAlignment:
          //   MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding:
          //       const EdgeInsets.all(8.0),
          //       child: Image.network(
          //         path_image,
          //         width: 80,
          //       ),
          //     ),
          //     Expanded(
          //         child: Wrap(
          //           direction: Axis.vertical,
          //           children: [
          //             Container(
          //                 padding: EdgeInsets.only(left: 14),
          //                 child: CustomText(
          //                   text: name,
          //                 )),
          //             Row(
          //               mainAxisAlignment:
          //               MainAxisAlignment.center,
          //               children: [
          //                 IconButton(
          //                     icon: Icon(
          //                         Icons.chevron_left),
          //                     onPressed: () {
          //                       // cartController.decreaseQuantity(cartItem);
          //                     }),
          //                 Padding(
          //                   padding:
          //                   const EdgeInsets.all(
          //                       8.0),
          //                   child: CustomText(
          //                     text: quantity.toString(),
          //                   ),
          //                 ),
          //                 IconButton(
          //                     icon: Icon(Icons
          //                         .chevron_right),
          //                     onPressed: () {
          //                       // cartController.increaseQuantity(cartItem);
          //                     }),
          //               ],
          //             )
          //           ],
          //         )),
          //     Padding(
          //       padding:
          //       const EdgeInsets.all(14),
          //       child: CustomText(
          //         text: "\$${price}",
          //         fontSize: 22,
          //         fontWeight:FontWeight.bold ,
          //       ),
          //     ),
          //   ],
          // ),

      ),
    );
  }
}