import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:souk/controllers/Contactus.dart';
import 'package:souk/view/utils/custom_text.dart';
import '../../../../constant.dart';
class DataPolicyScreen extends StatelessWidget {
  const DataPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Data Policy",
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Container(
              child:FutureBuilder(
                  future:Contactus.fetchContactus(),
                  builder: (context, snapshot) {
                    if(snapshot.data == null){
                      return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: primarycolor,
                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                      );
                    }
                    else {
                      return ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Html(
                              data:snapshot.data as String,
                            ),
                          )

                        ],
                      );
                    }
                  }
              )
          )
      ),
    );
  }
}