import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/auth_screen/signin.dart';
import 'package:naya_purana_bazar/auth_screen/verify.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

import '../constant/textformfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passwordObscured = true;
  bool click = true;


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images1/signup icon.jpg',height: 200),
          Center(child: Text('Create Account',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)),
            SizedBox(height: 5,),
            Text('Fill your information below or register',style: TextStyle(fontSize: 18,color: Colors.grey),),
            Text('with your social account',style: TextStyle(fontSize: 18,color: Colors.grey),),
            
            Form(
              key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name',style: userInputText),
                      SizedBox(height: w/190,),

                      Textformfieldsignup(
                        fullNameController: nameController,
                      hinttext: 'Username',
                        keyboardType: TextInputType.name,

                     ),
                      SizedBox(height: 20,),

                      Text('Email',style: userInputText),
                      SizedBox(height: w/190,),

                      Textformfieldsignup(
                        fullNameController: emailController,
                        hinttext: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height:20,),
                      Text('Password',style: userInputText),
                      SizedBox(height: w/190,),

                        TextFormField(
                          controller: passController,
                            keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            fillColor:Colors.white,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(color: Colors.orange, width: 2),
                            //     borderRadius: BorderRadius.circular(30)),
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(color: Colors.grey, width: 1),
                            //     borderRadius: BorderRadius.circular(30)),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },icon: Icon(
                              passwordObscured?Icons.visibility_off:Icons.visibility
                            ),)
                        )
                        ),
                      SizedBox(height: 20,),
                      Center(child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height:50,
                        width: double.infinity,
                          child: ElevatedButton(style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade700
                          ),
                              onPressed: (){
                            Get.to(()=>VerifyPage());
                              },
                              child: Text('Sign Up',style: signupButtonStyle)))),
                      SizedBox(height: 20,),

                      Center(child: Text('or sign up with',style: TextStyle(color: Colors.grey.shade500,fontSize: 16),)),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images1/facebook.png',scale: 1.3,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                              child: Image.asset('assets/images1/google.png',scale: 0.8,),
                            ),
                            Image.asset('assets/images1/instagram.png',scale: 0.5,),
                          ],
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                          style: TextStyle(fontSize: 16),),
                          TextButton(onPressed: (){
                            Get.to(()=>Signin());
                          }, child: Text('Sign In',
                          style:signinTextButton))
                        ],
                      )
                    ],
                  ),
                )),
        ],),
      ),
    );
  }
}
