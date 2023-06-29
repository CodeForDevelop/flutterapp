import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled11/Screeen.dart';
import 'package:untitled11/forgotpassword.dart';
import 'package:untitled11/utlis.dart';
import 'package:velocity_x/velocity_x.dart';
import 'loginwithphone.dart';
import 'signup.dart';
import 'roundbutton.dart';
import 'shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {


  LoginScreen({Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {





void _toggle() {
    setState(() {
      obscure=!obscure;
    });




}

  final _formfiled =GlobalKey<FormState>();
TextEditingController Emailcontroller = TextEditingController();
TextEditingController Passwordcontroller = TextEditingController();
FirebaseAuth _auth= FirebaseAuth.instance;
bool obscure=true;

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Emailcontroller.dispose();
    Passwordcontroller.dispose();
  }
bool loading=false;

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop:() async{
      SystemNavigator.pop();
      return true;
    },
              
                child: Scaffold(

          appBar: AppBar(
            automaticallyImplyLeading:false,
            title: Center(child: Text("Login")),),
             body:
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: SingleChildScrollView(
                     child: Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                       crossAxisAlignment:CrossAxisAlignment.center,
                         children: [
                           SizedBox(height: 60,),
                       Form(
                         key: _formfiled,
                         child: Column(
                           children: [
                             TextFormField(
                               controller: Emailcontroller,
                               decoration: InputDecoration(
                                 hintText: 'Email',
                                 helperText: "enter email e.g shivam@gmail.com",
                                 labelText: 'Email',
                                 prefixIcon: Icon(Icons.email),


                               ),
                               validator: (val){
                                 if(val!.isEmpty){
                                   return "Enter Email";
                                 }
                                 return null;
                               },






                             ),
                             SizedBox(height: 20,),
                             TextFormField(

                               controller: Passwordcontroller,
                               obscureText: obscure,
                               decoration: InputDecoration(

                                 hintText: 'Password',

                                 labelText: 'Password',
                                 prefixIcon: Icon(Icons.security),
                                 suffixIcon: TextButton(
                                   onPressed: _toggle,
                                   child: obscure?Icon(Icons.panorama_fish_eye):Icon(Icons.done),
                                 )

                               ),
                               validator: (val){
                                 if(val!.isEmpty){
                                   return "Enter Password";
                                 }
                                 return null;



        },







                             ),
                             SizedBox(height: 20,),
                             RoundButton(title: "Sign In",
                                 color: Colors.white,
                                 colors: Colors.deepPurple,
                                 loading: loading,
                                 onTap: (){
                                   if(_formfiled.currentState!.validate())
                                   {
                                     login();


                                   }}
                             ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()
                                  )
                                  );
                                },
                                    child: Text("Forgot password")),
                              ),


                             SizedBox(height: 20,),
                             Row( mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                               Text("Don't have a account ?"),
                               TextButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                               }, child: Text("Sign Up")

                               )



                             ],),
                             SizedBox(height: 10,),
                             RoundButton(title: "Login with phone number",
                                 color: Colors.white,
                                 colors: Colors.deepPurple,
                                 loading: loading,
                                 onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginwithPhone()));
                                  }
                             ),

                           ],
                         ),
                       )






                     ],),
                   ),
                 ),




        ),


    );
  }

void login() async{
  setState(() {
    loading = true;
  });

   await _auth.signInWithEmailAndPassword(email: Emailcontroller.text, password: Passwordcontroller.text.toString()).then((value){
        Helper.Emailid=Emailcontroller.text;
 setState(() {
   Helper.valueSharedPreferences=true;
 });



  Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen()));
  setState(() {
  loading=false;
  });

  }).onError((error, stackTrace) {
  utils().toastMessage(error.toString());
  setState(() {
  loading=false;
  });
  });


}


}

