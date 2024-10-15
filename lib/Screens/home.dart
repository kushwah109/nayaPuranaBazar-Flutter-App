
import 'package:flutter/material.dart';
import 'package:naya_purana_bazar/Screens/userprofile.dart';
import 'package:naya_purana_bazar/api/cateogries.dart';
import 'package:naya_purana_bazar/constant/container_widget_class.dart';
import 'package:naya_purana_bazar/constant/home_Bottom_Navigation.dart';
import 'package:naya_purana_bazar/constant/home_button.dart';
import 'package:naya_purana_bazar/constant/icons%20_class.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

import '../constant/nayabazar.dart';
import '../constant/puranabazar.dart';
import '../services/imgslider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
CatelogList catelogList = CatelogList();
  bool _LatestTrends = true;
  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar:HomeBottomNavigation(),
      drawer: UserprofileDrawer(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(onTap: (){
                          scaffoldKey.currentState!.openDrawer();
                        },
                            child: CircleAvatar(backgroundColor: colorCode,)),
                        SizedBox(width: w/60,),
                        Text('Nirbhika',style: nayabazarHeading.copyWith(fontSize: h/45),),
                      ],
                    ),

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text('Location',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    //     Row(
                    //       children: [
                    //         homeHistoryIcon,
                    //         Text(' New York, USA',style: TextStyle(
                    //             fontSize: 18,color: colorOrange
                    //         ),),
                    //         homeKeyDownIcon
                    //       ],
                    //     )
                    //   ],
                    // ),
                    Row(
                      children: [
                        ShoppingCardIconContainer(),

                        SizedBox(width: 4,),
                        NotificationIconContainer(),
                      ],
                    ),

                  ],
                ),

                SizedBox(height: 10,),
                Container(
                  height: h/20,
                  width: w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      color: Colors.grey.withOpacity(0.08)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      searchIcon,
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',hintStyle: TextStyle(color: Colors.grey,fontSize: 15 ),
                            )),
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: voiceIcon,color: Colors.grey,),
                          IconButton(onPressed: (){}, icon: cameraIcon,color: Colors.grey,),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h/40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Imgslider(),
                  SizedBox(
                    height: h/40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeButton(onpress: (){
                        setState(() {
                          _LatestTrends = true;
                        });
                      }, text: "Naya Bazar "),
                      HomeButton(onpress: (){
                        setState(() {
                          _LatestTrends = false;
                        });
                      }, text: " Purana Bazar"),
                    ],
                  ),
                  SizedBox(
                    height: h/60,
                  ),

                  FutureBuilder
                    (future: catelogList.fetchcatelog(),
                      builder: (context,snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData) {
                          return Center(child: Text('No data available'));
                        }
                        var categ = snapshot.data as List<dynamic>;
                        return  SizedBox(
                          height: h/7,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categ.length,
                              itemBuilder: (context, index){
                                var item = categ[index]as Map<String ,dynamic>;
                                String img = item['image'].toString();
                                String name = item['name'].toString();
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: ClipOval(child: Image.network(img,height:h/15,)),
                                    ),
                                    Text(name,style: TextStyle(fontSize: h/60,
                                        overflow: TextOverflow.fade,
                                        fontWeight:FontWeight.w500),)
                                  ],
                                );
                              }
                          ),
                        );

                      }
                      ),
                  // SizedBox(
                  //   height: h/30,
                  // ),
                  _LatestTrends?NayaBazar():PuranaBazar(),
              
                ],
              ),
            ),
          )
         
          // SizedBox(
          //   // height: h/30,
          //   width: double.infinity,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
          //     child: BottomNavigationBar(
          //       type: BottomNavigationBarType.shifting,
          //       backgroundColor:  Color(0xcfffed3a3),
          //       elevation: 0,
          //       iconSize: 35,
          //       selectedIconTheme: const IconThemeData(color: Colors.brown),
          //       selectedItemColor: Colors.brown,
          //       unselectedItemColor: Colors.orange.shade700,
          //       showSelectedLabels: false,
          //       showUnselectedLabels: false,
          //       currentIndex: selectedIndex,
          //       onTap: (index){
          //         setState(() {
          //           selectedIndex =index;
          //         });
          //       },
          //       items:const [
          //         BottomNavigationBarItem(icon:Icon(Icons.home_outlined),label:'home' ),
          //         BottomNavigationBarItem(icon:Icon(Icons.shopping_bag_outlined),label: 'bag' ),
          //         BottomNavigationBarItem(icon:Icon(Icons.favorite_outline),label: 'heart' ),
          //         BottomNavigationBarItem(icon:Icon(Icons.message_outlined),label: 'message' ),
          //         BottomNavigationBarItem(icon:Icon(Icons.person_2_outlined),label: 'profile' ),] ,),
          //   ),
          // ),

        ],
      ),

    );
  }
}
