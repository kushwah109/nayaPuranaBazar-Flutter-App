import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/Screens/home.dart';
import 'package:naya_purana_bazar/auth_screen/signup.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

import '../constant/textformfield.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Image.asset('assets/images1/login icon.jpg',height:h/4,width: w/0.5 ,),
            Center(child: Text('Sign In',style:userInputText)),
            SizedBox(height: 15,),
            Text("Hi Welcome back, you've been missed",style: TextStyle(fontSize: 18,color: Colors.grey),),
        
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',style: userInputText),
                      SizedBox(height: 15,),
                      Textformfieldsignup(
                        fullNameController: emailController,
                        hinttext: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20,),
                      Text('Password',style: userInputText,),
                      SizedBox(height: 15,),
                      TextFormField(
                          controller: passController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(30)),
                              suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  passwordObscured = !passwordObscured;
                                });
                              },icon: Icon(
                                  passwordObscured?Icons.visibility_off:Icons.visibility
                              ),)
                          )
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forget Password',style: forgetPass)
                        ],
                      ),
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
                              child: Text('Sign In',style: signinButtonStyle,)))),
                      SizedBox(height: 20,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Divider(thickness: 7,color: Colors.black,),
                      //     SizedBox(height: 10,),
                      //     Text('or sign up with',style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                      //     Divider()
                      //   ],
                      // )
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                            style: TextStyle(fontSize: 16),),
                          TextButton(onPressed: (){
                            Get.to(()=>Signup());
                          }, child: Text('Sign Up',
                            style: signupTextButton))
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
