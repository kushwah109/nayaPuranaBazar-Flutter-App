import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/icons _class.dart';
import '../constant/widget class.dart';
import 'home.dart';

class UserprofileDrawer extends StatelessWidget {
  const UserprofileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final h =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorCode,
        // backgroundColor: Colors.orange.shade700,
        leading: IconButton(onPressed: (){
          Get.to(()=>HomeScreen());
        },icon:backIcon,color: colorOrange,),
        title: Text('ACCOUNT',style: accountText.copyWith(fontSize:h/50 ),),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: searchIcon1,iconSize: h/28,color: colorOrange,),
              IconButton(onPressed: (){}, icon: shopingIcon,color: colorOrange,iconSize: h/28,)
            ],
          )
        ],
      ),
    );
  }
}
