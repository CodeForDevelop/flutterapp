import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'Screeen.dart';

import 'shared.dart';
class service{
  void isLogin(BuildContext context)
  {
    final auth = FirebaseAuth.instance;
    final user  = auth.currentUser;
if(user != null && Helper.valueSharedPreferences!=false){
  Timer(const Duration(seconds: 0),
          ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const Screen())));


}


else
  {
    Timer(const Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())));


  }










  }





}