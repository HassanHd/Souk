import 'package:flutter/material.dart';
import 'package:souk/view/utils/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../../../../constant.dart';
class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  Future<List<Data>> _getlistcontacts() async {
    var url =Uri.parse("https://www.srcform.com/eco/faqs");
    var response = await http.get(url);
    var responsbody = json.decode(response.body);
    print(responsbody);
    List<Data> list = [];
    for(var u in responsbody){
      Data x=Data(u["question"],u["answer"]  );
      list.add(x);
    }
    for(var c in list){
      print(c.question);
    }
    print("-----------> $list");
    return list;
  }
  @override
  void initState() {
    super.initState();
    this._getlistcontacts ();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // centerTitle: true,
          title: CustomText(
            text: "FAQ",
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
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: FutureBuilder(
                    future: _getlistcontacts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      if (snapshot.data == null) {
                        return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: primarycolor,
                              valueColor: new AlwaysStoppedAnimation<Color>(primarycolor,),
                            )
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ExpansionTile(
                                title: Text(
                                  snapshot.data[i].question,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black87
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title:Text("${snapshot.data[i].answer}"),
                                  ),
                                ],
                              );

                            });
                      }
                    }),
              ),

            ],
          ),


        ));
  }
}
class Data{
  String question;
  String answer;

  Data(this.question, this.answer);
}
