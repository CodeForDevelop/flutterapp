import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/Screeen.dart';
import 'package:untitled11/roundbutton.dart';
import 'package:untitled11/utlis.dart';
import 'package:velocity_x/velocity_x.dart';
class Verify extends StatefulWidget {

  String verificationid;
  Verify({super.key,required this.verificationid});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController phonenocontroller = TextEditingController();
  bool loading = false;
  final _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Verify".text.bold.color(Colors.white).make(),),
     body: Column(children: [

             TextFormField(controller: phonenocontroller,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
               hintText: "6 digit code"
             ),),
       SizedBox(height: 50,),
       RoundButton(title: "Verify",
           loading:loading,
           onTap: () async{
         final crendital = PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: phonenocontroller.text.toString());
         try{
           await _auth.signInWithCredential(crendital);
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen()));

         }catch(e){
           setState(() {
             loading=false;
           });
           utils().toastMessage(e.toString());

         }


       }, colors: Colors.deepPurple, color: Colors.white)














     ],





     ),



    );
  }
}
