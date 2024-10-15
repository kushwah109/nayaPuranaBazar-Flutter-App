import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/Controller/bottombar_controller.dart';
import 'package:naya_purana_bazar/Screens/categories.dart';
import 'package:naya_purana_bazar/constant/icons%20_class.dart';
import '../Screens/chat_Screen.dart';
import '../Screens/home.dart';
import '../Screens/likes_screen.dart';
import '../Screens/order_screen.dart';
import 'widget class.dart';

class HomeBottomNavigation extends StatefulWidget {
  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    CategoriesScreen(),
    LikesScreen(),
    ChatScreen(),
    OrderScreen(),
  ];

  BottomBarController indexController = Get.put(BottomBarController());

  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    // if(h>1000){
    //   return;
    // }
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Positioned(
    //             bottom: 0,
    //             child: BottomNavigationBar(
    //                     type: BottomNavigationBarType.fixed,
    //                     backgroundColor:  colorCode,
    //                     elevation: 8,
    //                     iconSize: h/27,
    //                     selectedLabelStyle: TextStyle(fontSize: h/60),
    //                     unselectedLabelStyle: TextStyle(fontSize: h/60),
    //
    //                     selectedIconTheme: IconThemeData(color:selectedBottomIconColor),
    //                     selectedItemColor: selectedBottomIconColor,
    //                     unselectedItemColor: colorOrange,
    //                     showSelectedLabels: true,
    //                     showUnselectedLabels: true,
    //                     currentIndex: indexController.selectedIndex.value,
    //                     onTap: (index){
    //                       indexController.changeTabIndex(index);
    //                     },
    //                     items: [
    //                       BottomNavigationBarItem(icon:homeIcon,label:'Home', ),
    //                       BottomNavigationBarItem(icon:categoriesIcon,label: 'Categories' ),
    //                       BottomNavigationBarItem(icon:favoriteOutlineIcon,label: 'Likes' ),
    //                       BottomNavigationBarItem(icon:messageIcon,label: 'Chat' ),
    //                       BottomNavigationBarItem(icon:orderIcon,label: 'My Orders' ),] ,
    //             ),
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );

    return SizedBox(
        height: h/12,
        width: double.infinity,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  colorCode,
          elevation: 8,
          iconSize: h/27,
          selectedLabelStyle: TextStyle(fontSize: h/60),
          unselectedLabelStyle: TextStyle(fontSize: h/60),

          selectedIconTheme: IconThemeData(color:selectedBottomIconColor),
          selectedItemColor: selectedBottomIconColor,
          unselectedItemColor: colorOrange,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          // onTap: (){
          //
          //   // indexController.changeTabIndex(index);
          // },
          items: [
            BottomNavigationBarItem(icon:homeIcon,label:'Home', ),
            BottomNavigationBarItem(icon:categoriesIcon,label: 'Categories' ),
            BottomNavigationBarItem(icon:favoriteOutlineIcon,label: 'Likes' ),
            BottomNavigationBarItem(icon:messageIcon,label: 'Chat' ),
            BottomNavigationBarItem(icon:orderIcon,label: 'My Orders' ),] ,
        ),
      );





  }
}





