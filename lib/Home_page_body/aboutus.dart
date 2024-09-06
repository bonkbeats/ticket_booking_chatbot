import 'package:flutter/material.dart';
import 'package:ticket_booking_chat_app/utills/common_widget.dart';
import 'package:ticket_booking_chat_app/utills/consts.dart';
import 'package:ticket_booking_chat_app/utills/utills.dart';
import 'package:cxgenie/cxgenie.dart'; // Import cxgenie package
import 'package:cxgenie/enums/language.dart'; // Import cxgenie enums

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  bool showChatbot = false; // State to control the visibility of the Chatbot

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content of the page with scrollable functionality
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
            child: Container(
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: hexToColor('#E4D894'),
                    height: 45,
                    width: 150,
                    child: Center(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showChatbot = !showChatbot; // Toggle visibility
                            });
                          },
                          child: const Text(
                            'BOOK TICKET',
                            style: TextStyle(
                              fontFamily: 'JejuMyeongjo-Regular',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'The Museum AI Booking Chatbot is an intelligent virtual assistant designed to streamline the visitor experience for your museum. It offers a seamless and user-friendly interface that allows guests to effortlessly book tickets, schedule guided tours, and access information about exhibitions and events. With 24/7 availability, the chatbot provides real-time responses to visitor inquiries, suggests personalized experiences based on visitor preferences, and even provides details about accessibility options, opening hours, and nearby amenities. Whether guests are planning their visit in advance or need quick information on the go, the Museum AI Booking Chatbot ensures a convenient, efficient, and engaging experience for all.',
                    style: TextStyle(fontFamily: 'JejuMyeongjo-Regular'),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'The Museum AI Booking Chatbot is a cutting-edge virtual assistant designed to enhance the visitor experience by providing a range of convenient and interactive services. This AI-powered chatbot is accessible via the museum\'s website, mobile app, or social media channels, making it easy for visitors to interact with it anytime, anywhere.',
                    style: TextStyle(fontFamily: 'JejuMyeongjo-Regular'),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Chatbot overlay positioned on the far left side and fixed
        if (showChatbot)
          Positioned(
            left: 0, // Align to the far left side
            top: 50, // Adjust the top position as needed
            child: SingleChildScrollView(
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent scrolling
              child: Container(
                width: 500,
                height: 500,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(2, 4), // Shadow positioning
                    ),
                  ],
                ),
                child: const Chat(
                  botId: '7e4dd37c-6a61-41a6-bfea-3f50f79fcccf',
                  userToken: 'USER_TOKEN',
                  language: LanguageOptions.vi,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
