import 'package:flutter/material.dart';
import 'package:untitled11/main.dart';
import 'splashservice.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  service splashScreen =service();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);

  }
  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      appBar: AppBar(

        title:Row(
          children: [
            Container(
              height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white
                  )

                ),
                child: Icon(Icons.shopping_cart_rounded)),
            SizedBox(width: 5,),
            Text(
            " My Shop ",
            style: TextStyle(
                fontSize:35,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
      ),
          ],
        ),
      ),


      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(

              child: Image.asset("assets/images/img.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Welcome to My Shop ",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
