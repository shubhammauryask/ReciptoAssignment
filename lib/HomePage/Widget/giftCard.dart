
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipto/HomePage/Model/giftModel.dart';

Widget giftCard(BuildContext context,GiftCard data,VoidCallback showTransactionBottomSheet){
  return Container(
    width: 200, // Adjust width as needed
    decoration: BoxDecoration(
      gradient:data.backgroundColor, // Light blue background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Party popper emoji or custom icon
          Center(
            child: Image.asset(
              data.image,
              height: 90,
              width: 90,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          // Claim text
           Text(
            data.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          // Amount row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 4),
              //   child: const Icon(
              //     Icons.monetization_on,
              //     color: Colors.orange,
              //     size: 20,
              //   ),
              // ),
               Text(
                data.offerText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomPaint(
            size: const Size(double.infinity, 1), // Full width divider
            painter: DottedLinePainter(),
          ),
          const SizedBox(height: 10),
          // Claim button
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if(data.applied == false) {
                  showTransactionBottomSheet();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                elevation: 0,
              ),
              child:  Text(
                data.buttonText,
                style: TextStyle(
                  fontSize: 16,
                  color: (data.applied)?Colors.grey:Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey // Line color
      ..strokeWidth = 1 // Thickness of the dots
      ..style = PaintingStyle.fill;

    double startX = 0;
    double dashWidth = 12; // Length of the dash
    double dashSpace = 5; // Space between dashes
    final double endX = size.width;

    while (startX < endX) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}