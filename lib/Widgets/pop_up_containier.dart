import 'package:flutter/material.dart';
import 'package:healthlane_mobileapp2_survey/constants/constants.dart';

class PopupContainer extends StatelessWidget {
  final String category;
  final Widget child;
  PopupContainer({this.category, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSecondaryLight2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kSecondaryLight2,
              ),
              child: child),
          Row(
            children: [
              Text(
                category,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 5),
            ],
          )
        ],
      ),
    );
  }
}