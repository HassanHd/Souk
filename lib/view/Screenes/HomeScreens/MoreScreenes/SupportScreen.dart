
import 'package:flutter/material.dart';
import 'package:souk/view/utils/CustomButton.dart';
import 'package:souk/view/utils/custom_text.dart';

import '../../../../constant.dart';
class SupportScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _TitleController = TextEditingController();
  TextEditingController _disController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "Support",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Title",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _TitleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            // filled: true,
                              fillColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              hintText: " Give your query a title."),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please Enter Title';
                            }
                            return null;
                          },
                        ),
                      )
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _disController,

                          maxLines: 10,
                          //keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            // filled: true,
                              fillColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color:Colors.white),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                              hintText: "what's making you unhappy?"),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please Enter Title';
                            }
                            return null;
                          },
                        ),
                      )
                  ),


                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  CustomButton(
                    text: 'SEND',
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                  ),


                ],
              ),
            ),
          ),
        )

    );
  }
}
