import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/roundbutton.dart';
import 'package:untitled11/utlis.dart';
import 'package:velocity_x/velocity_x.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller =TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: "Forgot Password".text.bold.color(Colors.white).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(

              controller: emailcontroller,
              decoration:  InputDecoration(
                hintText: "Email"

              ),


            ),
            SizedBox(height: 40,),
            RoundButton(title: "Forgot",
                colors: Colors.deepPurple,
                color: Colors.white,
                onTap: (){
              _auth.sendPasswordResetEmail(email: emailcontroller.text.toString()).then((value) {
                utils().toastMessage("We have sent you a mail to recover password , please check your email ");

              } ).onError((error, stackTrace){
                utils().toastMessage(error.toString());
              });




            })


















          ],
        ),
      ),




















    );
  }
}
