import 'package:flutter/material.dart';
import 'package:ticket_booking_chat_app/utills/utills.dart';

Widget buildButton(
  String title,
  Function onPressed, {
  double leftMargin = 30,
  double rightMargin = 30,
  double topMargin = 0,
  double bottomMargin = 40,
  double borderRadius = 20,
  double fontSize = 20,
  double height = 65,
  double width = double.infinity,
  String backgroundColor = '#C7E5FA',
  String textColor = "#000000",
  var isButtonVisible = true,
  var isProgressBarVisible = false,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(
          leftMargin,
          topMargin,
          rightMargin,
          bottomMargin,
        ),
        child: Visibility(
          visible: isButtonVisible,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: hexToColor(backgroundColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background
                elevation: 1, // No shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "JejuMyeongjo",
                    color: hexToColor(textColor),
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isProgressBarVisible,
        child: const CircularProgressIndicator(color: Color(0xFF4F346B)),
      ),
    ],
  );
}
