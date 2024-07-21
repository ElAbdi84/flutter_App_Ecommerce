import 'package:flutter/material.dart';
import 'login_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildPage(
            context,
            'Choose Your Product',
            'Welcome to a World of Limitless Choices - Your Perfect Product Awaits!',
            'assets/images/intro1.png',
          ),
          buildPage(
            context,
            'Deliver At Your Door Step',
            'From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!',
            'assets/images/intro2.png',
          ),
          buildPage(
            context,
            'Welcome Back',
            'Discover Limitless Choices and Unmatched Convenience.',
            'assets/images/intro3.png',
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget buildPage(BuildContext context, String title, String subtitle, String imagePath, {bool isLastPage = false}) {
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
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Get Started'),
          ),
      ],
    );
  }
}
