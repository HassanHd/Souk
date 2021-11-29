import 'package:flutter/material.dart';
import 'package:souk/controllers/helperCart.dart';
import 'package:souk/view/utils/CartItem.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Your Cart",
          color: primarycolor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),


      ),
      body: FutureBuilder(
        future: HelperCart().getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text("no prodect"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child:  Row(
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
                              child: Image.network("${snapshot.data[index].path_image}"),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${snapshot.data[index].name}"  ,
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                  maxLines: 2,
                                ),
                                SizedBox(width: 60),
                                IconButton(
                                  onPressed: (){
                                  AlertDialog(
                                    title: Text('Are you sure!'),
                                    content: Text('Do you want to remove the cart item?'),
                                    actions: <Widget>[
                                      FlatButton(child: Text('No'), onPressed: (){
                                      },),
                                      FlatButton(child: Text("Yes"), onPressed: (){
                                        HelperCart().deleteProduct(snapshot.data[index].product_id).then((value) {
                                          print("delet suc");
                                          // Navigator.of(context).pop(true);

                                        });

                                      },)
                                    ],
                                  );
                                }, icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),)

                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "\$${snapshot.data[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600, color: primarycolor),
                                    children: [
                                      TextSpan(
                                          text: " x${snapshot.data[index].quantity}",
                                          style: Theme.of(context).textTheme.bodyText1),
                                    ],
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/8),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                            Icons.chevron_left),
                                        onPressed: () {
                                          // quantity++;
                                          // cartController.decreaseQuantity(cartItem);
                                        }),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(
                                          8.0),
                                      child: CustomText(
                                        text: snapshot.data[index].quantity.toString(),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons
                                            .chevron_right),
                                        onPressed: () {
                                          // quantity--;

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
                  );
                  // return CartItem(productId:"${snapshot.data[index].product_id}", price: double.parse(snapshot.data[index].price),name: "${snapshot.data[index].name}",path_image:"${snapshot.data[index].path_image}",quantity:snapshot.data[index].quantity,);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: primarycolor,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}


