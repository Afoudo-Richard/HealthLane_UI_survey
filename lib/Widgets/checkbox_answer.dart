import 'package:flutter/material.dart';
import 'package:healthlane_mobileapp2_survey/constants/constants.dart';

class CheckboxAnswer extends StatefulWidget {
  bool ischecked;
  final String optionText;
  CheckboxAnswer({this.ischecked, this.optionText});

  @override
  _CheckboxAnswerState createState() => _CheckboxAnswerState();
}

class _CheckboxAnswerState extends State<CheckboxAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                widget.ischecked = !widget.ischecked;
              });
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: widget.ischecked ? kPrimaryColor : Colors.transparent,
                border: Border.all(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: widget.ischecked
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : Container(),
            ),
          ),
          SizedBox(width: 13),
          Container(
            width: MediaQuery.of(context).size.width * .75,
            child: Text(
              widget.optionText,
              style: kButtonTextStyle.copyWith(fontSize: 17),
              softWrap: true,
              maxLines: 4,
            ),
          )
        ],
      ),
    );
  }
}
