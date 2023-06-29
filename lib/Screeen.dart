import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:untitled11/login.dart';
import 'package:untitled11/shared.dart';

import 'cartlogheader.dart';
import 'splashservice.dart';
import 'dart:convert';
import 'cartlog.dart';
import 'cart.dart';
import 'cartloglist.dart';
import 'package:velocity_x/velocity_x.dart';

import 'drawer.dart';
class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }
  loaddata() async {
    await Future.delayed(const Duration(seconds: 5));
    final calljson = await rootBundle.loadString("assets/file/file.json");

    final decodedata = jsonDecode(calljson);

    var productsdat = decodedata["products"];

    Catlogmodel.items =
        List.from(productsdat).map<item>((Item) => item.fromMap(Item)).toList();
    setState(() {

    });
  }
  service splashScreen =service();
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController searchcontroller =TextEditingController();
  String searcch="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:
        AppBar(




          actions: [IconButton(onPressed: () async {



            await auth.signOut().then((value) =>
            {setState(() {
            Helper.valueSharedPreferences=false;
            splashScreen.isLogin(context);
            }),



              Navigator.pop(context, true),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen(

                  )))});
          }, icon: const Icon(Icons.logout, color: Colors.white,)),

          ],
          ),


        drawer: const MyDrawer(),

        body:  SafeArea(
            child:Column(
              children: [

                Container(padding: Vx.m12,
                  child:const CatlogHeader(),
                ),

                Row(
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,




                      ),
                      child: TextFormField(
 controller: searchcontroller,

                        decoration: InputDecoration(
                          labelText: "search",
                          hintText:"Search",
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                        ),


                      )
                      ,


                    ).p8().expand(),

                  ],
                ),




                if(Catlogmodel.items.isNotEmpty)

                    CatlogList().py16().expand()



                else
                  Center(
                    child: const CircularProgressIndicator().centered().py16().expand(),
                  )

              ],
            )
        ),


          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return const Cart();
            }));




          },
            backgroundColor:Colors.deepPurple,

            child: const Icon(Icons.shopping_cart,color: Colors.white,),

          )


      );

  }
}
