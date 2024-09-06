import 'package:flutter/material.dart';
import 'package:ticket_booking_chat_app/responsive/responsive.dart';
import 'package:ticket_booking_chat_app/utills/common_widget.dart';
import 'package:ticket_booking_chat_app/utills/consts.dart';
import 'package:ticket_booking_chat_app/utills/utills.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return FeatureSectionState();
  }
}

class FeatureSectionState extends State<FeatureSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    isEnglish ? "facilities in english" : "facilities in hindi",
                    style: TextStyle(
                      fontSize: 24,
                      color: hexToColor("#212C62"),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            ),
            if (Responsive.isDesktop(context))
              const FeaturesGridLayout(crossAxisCount: 6),
            if (!Responsive.isDesktop(context))
              const FeaturesGridLayout(crossAxisCount: 2),
          ],
        ),
      ),
    );
  }
}

class FeaturesGridLayout extends StatefulWidget {
  final int crossAxisCount;
  const FeaturesGridLayout({super.key, required this.crossAxisCount});

  @override
  State<FeaturesGridLayout> createState() => _FeaturesGridLayoutState();
}

class _FeaturesGridLayoutState extends State<FeaturesGridLayout> {
  int _hoverIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2),
          itemCount: gridMap.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hoverIndex = index;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hoverIndex = -1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _hoverIndex == index
                          ? Colors.white // Change color on hover
                          : hexToColor("#F3F8FF"),
                      boxShadow: _hoverIndex == index
                          ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.8),
                                blurRadius: 20,
                                offset: const Offset(20, 20),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                    ),
                    transform: _hoverIndex == index
                        ? Matrix4.diagonal3Values(1, 1, 1.2)
                        : Matrix4.identity(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            gridMap[index]
                                ['image'], // Remove string interpolation here
                            width: 55,
                            height: 80,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Text(
                                  'Image not found'); // Handle error gracefully
                            },
                          ),
                          Text(
                            "${gridMap.elementAt(index)['title']}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
