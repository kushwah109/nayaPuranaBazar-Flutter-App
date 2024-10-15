import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naya_purana_bazar/auth_screen/signup.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

class Introslider extends StatefulWidget {
  const Introslider({super.key});

  @override
  State<Introslider> createState() => _IntrosliderState();
}

class _IntrosliderState extends State<Introslider> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffee8d0),
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
          'assets/images1/logo screen.jpg', // Replace with your image path
          'Naya Purana Bazar ',
            'Welcome to\n Our\n Dual Market Platform',
          'Discover new and exciting products or find amazing deals on old favorites.',
              () {
            _pageController.nextPage(
              duration: Duration(milliseconds: 30),
              curve: Curves.easeIn,
            );
          },
        ),
          _buildPage(
            'assets/images1/shopingbags.jpg', // Replace with your image path
            'Naya Purana Bazar ',
            'Welcome to Our Dual Market Platform',
            'Discover milions new and exciting products or find amazing deals on old favorites in one place.',
                () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          _buildPage(
            'assets/images1/old deal.jpg', // Replace with your image path
            'Naya Purana Bazar ',
            'Old Products Market',
            'Find great deals on classic items and older products.',
                () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          _buildPage(
            'assets/images1/screen2.jpg', // Replace with your image path
            'Naya Purana Bazar ',
            'Latest Trends...',
            'New and Old Markets with great Deals and trends.',
                () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
            },
          ),
        ],
      ),
    );
  }
}
Widget _buildPage(String imagePath, String title, String subtitle,String subheading, VoidCallback onNext) {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
      Positioned(
        top: 100,left: 20,
        child: Text(
          title,
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ),
      ),
      SizedBox(height: 10),
      Positioned(
        top: 150,
        left: 20,right: 20,
        child: Text(
          subtitle,
          style: GoogleFonts.lato(
              textStyle:TextStyle(fontSize: 28, color:colorOrange,
                fontWeight: FontWeight.bold,
             )
          )


        ),
      ),
      SizedBox(height: 10),
      Positioned(
        left: 20,right: 20,
        bottom: 100,
        child: Text(
          maxLines: 3,
          subheading,
          // overflow: TextOverflow.visible,
          style: GoogleFonts.aBeeZee(
              textStyle:TextStyle(fontSize: 22, color: Colors.white,),
          )
        ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 6,
            shadowColor: colorOrange
          ),
          onPressed: onNext,
          child: Text('Next',style: TextStyle(
            color:colorOrange,fontSize: 25
          ),),
        ),
      ),
    ],
  );
}
