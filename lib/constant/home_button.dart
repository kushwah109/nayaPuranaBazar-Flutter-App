import 'package:flutter/material.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

class HomeButton extends StatelessWidget {
  final Function onpress;
  final String text;
  const HomeButton(
      {super.key, required this.onpress, required this.text});

  @override
  Widget build(BuildContext context) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        onpress();
      },
      child: Card(
        elevation: 8,
        shadowColor: Colors.white,
        child: Container(
          height:h/ 18,
          width: w/2.5,
          decoration: BoxDecoration(
            color: Color(0xcfffed3a3),
            // boxShadow: [BoxShadow(color: Color(0xcfffed3a3), blurRadius: 5, spreadRadius: 2)],
            borderRadius: BorderRadius.all(Radius.circular(10))
        
          ),
          child: Center(child: Text(text,style: TextStyle(
              fontSize:h/40,color: colorOrange,fontWeight: FontWeight.w700),)),
        ),
      ),
    );
  }
}
