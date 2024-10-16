import 'package:flutter/material.dart';

import 'icons _class.dart';
import 'widget class.dart';

class ShoppingCardIconContainer extends StatelessWidget {
  const ShoppingCardIconContainer({super.key});


  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
    height: h/20,

    decoration: BoxDecoration(
shape: BoxShape.circle,
color: colorCode.withOpacity(0.5)
),
child: IconButton(onPressed: (){}, icon:shoppingCardIcon,color: colorOrange,iconSize: h/30,));
  }
}


class NotificationIconContainer extends StatelessWidget {
  const NotificationIconContainer({super.key});



  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
    height: h/20,
    decoration: BoxDecoration(
shape: BoxShape.circle,
color:colorCode.withOpacity(0.5)
),
child: IconButton(onPressed: (){}, icon: notificationAddIcon,color:colorOrange,iconSize: h/30,));
  }
}


class ImportIconContainer extends StatelessWidget {
  const ImportIconContainer({super.key});



  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
    height: h/20,

    decoration: BoxDecoration(
shape: BoxShape.circle,
color: const Color(0xfffed3a3).withOpacity(0.5),),
child: IconButton(onPressed: (){}, icon: importIcon,color:colorOrange,iconSize: 25,))
;
  }
}


class GridIconContainer extends StatelessWidget {
  const GridIconContainer({super.key});



  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
    height: h/20,

    decoration: BoxDecoration(
shape: BoxShape.circle,
color: Color(0xcfffed3a3).withOpacity(0.5),),
child: IconButton(onPressed: (){}, icon: gridIcon,color:colorOrange,iconSize: 25,));
  }
}

// class Homeheadingstyle  extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//
//     return
//       TextStyle(fontSize: h/25,fontWeight: FontWeight.w500);
//   }
// }
