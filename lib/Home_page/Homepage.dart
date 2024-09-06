import 'package:flutter/material.dart';
import 'package:ticket_booking_chat_app/Home_page_body/aboutus.dart';
import 'package:ticket_booking_chat_app/Home_page_body/facilites.dart';
import 'package:ticket_booking_chat_app/Home_page_body/header.dart';
import 'package:ticket_booking_chat_app/Home_page_body/highlights.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Header(),
        HighlightsSection(),
        Aboutus(),
        FeatureSection(),
      ],
    );
  }
}
