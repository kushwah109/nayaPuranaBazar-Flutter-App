import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/Screens/home.dart';
import 'package:naya_purana_bazar/auth_screen/signup.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';
import 'package:pinput/pinput.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController pincontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size h =MediaQuery.of(context).size;
    Size w =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(()=>Signup());
              },
              child: Container(
                margin: EdgeInsets.only(left: 20,top: 30,bottom: 40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.keyboard_backspace,size: 30,),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Verify Code',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)),
                SizedBox(height: 13,),
                Text('Please enter the code we just send to email',style:verifyStyle1),
                Text('example@gmail.com',style:verifyStyle2),
                SizedBox(height: 50,),
                Pinput(
                  controller: pincontroller,
                  mainAxisAlignment: MainAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    margin: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                    height: h.height*0.06,
                    width: w.width*0.12,
                    textStyle: TextStyle(
                      fontSize: 24
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                    )
                  ),
                ),
        
                SizedBox(height: 50,),
                Text("Don't receive OTP?",style: verifyStyle1,),
                SizedBox(height: 1,),
                Text('Resend code',style: verifyStyle2),
        
                SizedBox(height: 40,),
                Center(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height:60,
                    width: double.infinity,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700
                    ),
                        onPressed: (){
                      Get.to(()=>HomeScreen());
                        },
                        child: Text('Verify',style: verifyButtonStyle)))),
        
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
