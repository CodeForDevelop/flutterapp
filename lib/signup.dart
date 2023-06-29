import 'package:flutter/material.dart';
import 'package:untitled11/utlis.dart';
import 'login.dart';
import 'roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  final _formfiled =GlobalKey<FormState>();
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  bool loading = false;
  bool pass = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Emailcontroller.dispose();
    Passwordcontroller.dispose();
  }
  void login(){
    setState(() {
      loading = true;
    });

    _auth.createUserWithEmailAndPassword(email: Emailcontroller.text.toString(), password: Passwordcontroller.text.toString()).then((value){
      loading=false;
      pass = pass.toggle();
    }).onError((error, stackTrace) {
      utils().toastMessage("Not Valid Info");
      setState(() {
        loading=false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text("Sign up")),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Form(
                key: _formfiled,
                child: Column(
                  children: [
                    TextFormField(
                      controller: Emailcontroller,
                      decoration: const InputDecoration(
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
                    const SizedBox(height: 20,),
                    TextFormField(

                        controller: Passwordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(

                          hintText: 'Password',

                          labelText: 'Password',
                          prefixIcon: Icon(Icons.security),


                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Password";
                          }
                          return null;



                        }







                    ),
                    const SizedBox(height: 20,),

                    RoundButton(title: "Sign up",
                        colors: Colors.deepPurple,
                        color: Colors.white,
                        loading: loading,
                        onTap: (){
                          if(_formfiled.currentState!.validate())
                          {
                           login();


                          }}
                    ),
                    const SizedBox(height: 20,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have a account ?"),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        }, child: const Text("Login ")

                        )



                      ],)

                  ],
                ),
              )






            ],),
        )



    );
  }
}
