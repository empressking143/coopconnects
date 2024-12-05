import 'package:flutter/material.dart';

class NumberRegisteredScreen extends StatefulWidget {
  const NumberRegisteredScreen({Key? key}) : super(key: key);

  @override
  _NumberRegisteredScreenState createState() =>
      _NumberRegisteredScreenState();
}

class _NumberRegisteredScreenState extends State<NumberRegisteredScreen> {
  int? selectedIndex; // Tracks the selected response button index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E8),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: const Text(
          'Number already registered',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFF800000),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Here’s what you can do:",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            buildStep(1, "Check if the mobile number you’ve entered is correct"),
            const SizedBox(height: 12),
            buildStep(2, "Log into your CoopConnects account with the correct email address linked to this number"),
            const SizedBox(height: 24),
            buildText("If the number is correct, it’s likely the previous user of the mobile number registered it already."),
            const SizedBox(height: 16),
            buildText("If you’re still unable to log into your account, please reach out to us for support. We’ll be in touch to verify your account and help with the next steps."),
            const SizedBox(height: 24),
            const Text(
              "Was this helpful?",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            buildResponseButton('Yes, it was helpful', 0),
            const SizedBox(height: 12),
            buildResponseButton('No, I need more help', 1),
          ],
        ),
      ),
    );
  }

  Widget buildStep(int stepNumber, String stepText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(0.05),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              '$stepNumber',
              style: const TextStyle(
                color: Color(0xFF800000),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            stepText,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildResponseButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = (selectedIndex == index) ? null : index;
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xFF800000) 
              : Colors.white, 
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selectedIndex == index
                  ? Colors.white 
                  : const Color(0xFF800000), 
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
