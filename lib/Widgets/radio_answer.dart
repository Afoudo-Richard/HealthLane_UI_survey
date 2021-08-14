import 'package:flutter/material.dart';
import 'package:healthlane_mobileapp2_survey/constants/constants.dart';

class RadioButtonAnswer extends StatefulWidget {

  final String optionText;
  dynamic groupValue;
  final int value;

  RadioButtonAnswer(
      {
      this.optionText,
      @required this.value,
      @required this.groupValue,
      });

  @override
  _RadioButtonAnswerState createState() => _RadioButtonAnswerState();
}

class _RadioButtonAnswerState extends State<RadioButtonAnswer> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       GestureDetector(
    //         onTap: widget.onTap,
    //         child: ClipOval(
    //           child: Container(
    //             height: 25,
    //             width: 25,
    //             decoration: BoxDecoration(
    //               color: Colors.transparent,
    //               border: Border.all(width: 2, color: kPrimaryColor),
    //               borderRadius: BorderRadius.circular(35),
    //             ),
    //             child: widget.ischecked
    //                 ? Center(
    //                     child: Icon(
    //                       Icons.circle,
    //                       color: kPrimaryColor,
    //                       size: 18,
    //                     ),
    //                   )
    //                 : Container(),
    //           ),
    //         ),
    //       ),
    //       SizedBox(width: 13),
    //       Container(
    //         width: MediaQuery.of(context).size.width * .75,
    //         child: Text(
    //           widget.optionText,
    //           style: kButtonTextStyle.copyWith(fontSize: 17),
    //           softWrap: true,
    //           maxLines: 4,
    //         ),
    //       )
    //     ],
    //   ),
    // );

    return RadioListTile(
      title: Text(
        widget.optionText,
        style: kButtonTextStyle.copyWith(fontSize: 17),
        softWrap: true,
        maxLines: 4,
      ),
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: (v){
        setState((){
          widget.groupValue = v;
        });
      },
      activeColor: kPrimaryColor,
    );

    
  }
}
