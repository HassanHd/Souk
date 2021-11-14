import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';



class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  String type;

  ChoiceChipWidget(this.reportList, this.type);

  @override
  ChoiceChipWidgetState createState() => new ChoiceChipWidgetState();
}

class ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String selectedChoice = "";

  bool selectedAcad = false;
  bool selectedRoom = false;
  bool selectedStudy = false;

  _buildChoiceList() {
    List<Widget> choices=[] ;
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(5.0),
        child: ChoiceChip(
          label: Container(
              padding: EdgeInsets.all(8.0),
              //height: 70.0,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(item),
              )),
          labelStyle: TextStyle(
              color: Color(0xff95989A), fontSize: 17.0, fontFamily: 'JF Flat Regular'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color(0xffF4F4F4),
          selectedColor: primarycolor,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              if (widget.type == "acad") {
                setState(() {
                  // AcademicState.acad = selectedChoice;
                  selectedAcad = true;
                });
              } else if (widget.type == "classroom"){
                setState(() {
                  // ClassroomState.room = selectedChoice;
                  selectedRoom = true;
                });
              }
              else{
                setState(() {
                  // StudySystemState.study = selectedChoice;
                  selectedStudy = true;
                });
              }
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        scrollDirection: Axis.horizontal,

        children: _buildChoiceList(),
      ),
    );
  }
}