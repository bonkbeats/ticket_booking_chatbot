import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ticket_booking_chat_app/utills/utills.dart';

class HighlightsSection extends StatefulWidget {
  const HighlightsSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return HighlightsSectionState();
  }
}

class HighlightsSectionState extends State<HighlightsSection> {
  final myitems = [
    Image.asset('assets/images/1a.jpg'),
    Image.asset('assets/images/2a.jpg'),
    Image.asset('assets/images/3a.jpg'),
    Image.asset('assets/images/4a.jpg'),
    Image.asset('assets/images/5a.jpg'),
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 325,
                  color: hexToColor("#FEF5D9"),
                ),
                Container(
                  width: double.infinity,
                  height: 125,
                  color: hexToColor("#F3F8FF"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "Museum highlights",
                    style: TextStyle(
                      fontSize: width > 600 ? 24 : 20,
                      fontWeight: FontWeight.w700,
                      color: hexToColor("#212C62"),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: 0,
                      viewportFraction: width < 500 ? 1.0 / 1 : 1 / 3.0,
                      height: 300,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 200),
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      aspectRatio: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    ),
                    items: myitems,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
