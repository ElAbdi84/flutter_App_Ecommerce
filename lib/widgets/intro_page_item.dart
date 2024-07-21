import 'package:flutter/material.dart';

class IntroPageItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isLastPage;
  final VoidCallback onPressed;

  IntroPageItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.isLastPage = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        SizedBox(height: 20),
        if (isLastPage)
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Get Started'),
          ),
      ],
    );
  }
}
