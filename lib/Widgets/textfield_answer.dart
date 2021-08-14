import 'package:flutter/material.dart';
import 'package:healthlane_mobileapp2_survey/constants/constants.dart';

class TextFieldAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'Enter Question here adglia gdbaiu baiud gbauib hjsf fshij hsajd aoiibciusa cai haihs aodso hauihcai igacs gacug bscub',
              style: kButtonTextStyle.copyWith(fontSize: 17),
              softWrap: true,
              maxLines: 4,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Enter you Answer here',
              labelText: 'Your Answer',
              hintStyle: TextStyle(fontSize: 20),
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            ),
          ),
        ],
      ),
    );
  }
}
