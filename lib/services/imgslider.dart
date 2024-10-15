import 'package:flutter/material.dart';
import 'package:naya_purana_bazar/constant/data_list.dart';

class Imgslider extends StatefulWidget {
  const Imgslider({super.key});

  @override
  State<Imgslider> createState() => _ImgsliderState();
}

class _ImgsliderState extends State<Imgslider> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    Size h = MediaQuery.of(context).size;
    // Size w = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: h.height*0.2,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                currentSlider = value;
              });
            },
            itemCount: slideimg.length,
              itemBuilder: (BuildContext context , int index){
            String img = slideimg[index];
            return Container(
              height: h.height/0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(img),
                )
              ),
            );
          }),
        ),
        Positioned.fill(
          bottom: 10,
            child: Align(alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(slideimg.length,
                  (index)=>AnimatedContainer(
                      duration: Duration(microseconds: 300),
                  height: 10,width:currentSlider == index?15: 10,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: currentSlider == index ?Colors.black :Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)
                  ),)),
        ),))
      ],
    );
  }
}
