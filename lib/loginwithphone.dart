import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:untitled11/roundbutton.dart';
import 'package:untitled11/utlis.dart';
import 'package:untitled11/verify.dart';
import 'package:velocity_x/velocity_x.dart';
    class LoginwithPhone extends StatefulWidget {

       LoginwithPhone({super.key});

      @override
      State<LoginwithPhone> createState() => _LoginwithPhoneState();
    }

    class _LoginwithPhoneState extends State<LoginwithPhone> {
      TextEditingController phonenocontroller = TextEditingController();

      bool loading = false;
      final _auth= FirebaseAuth.instance;
      @override
      Widget build(BuildContext context) {
        return Scaffold(

          appBar: AppBar(title: Center(child: "Login".text.bold.color(Colors.white).make()),),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             TextFormField (
                controller: phonenocontroller,

                decoration: InputDecoration(

                  hintText: "8987988449",
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  )
                ),

              ),

              SizedBox(height: 30,),
              RoundButton(loading: loading,
                  title: "Login", onTap: (){

                setState(() {
                  loading=true;
                });
                _auth.verifyPhoneNumber(phoneNumber: phonenocontroller.text,
                    verificationCompleted: (_){
                  setState(() {
                    loading=false;
                  });

                }, verificationFailed:(e){
                  utils().toastMessage(e.toString());
                }, codeSent: (String verification , int? token){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify(verificationid: verification,))

                  );
                  setState(() {
                    loading=false;
                  });
                },
                    codeAutoRetrievalTimeout: (e){

                 utils().toastMessage(e.toString());
                });
              }, colors: Colors.deepPurple, color: Colors.white)












            ],),
          ),













        );
      }
    }
