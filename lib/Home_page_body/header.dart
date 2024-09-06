import 'package:flutter/material.dart';
import 'package:ticket_booking_chat_app/utills/common_widget.dart';
import 'package:ticket_booking_chat_app/utills/consts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: const Color.fromARGB(255, 152, 150, 150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildButton("change font", width: 100, height: 60, () {
            setState(() {
              isEnglish = !isEnglish;
            });
          }),
        ],
      ),
    );
  }
}
