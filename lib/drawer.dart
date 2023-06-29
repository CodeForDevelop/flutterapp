import 'package:flutter/material.dart';
import 'package:untitled11/shared.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.deepPurple,
        child: ListView(

          children:  [
            DrawerHeader(

              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("shivam"),
                accountEmail: Text("Shivam9211bansal@gmail.com"),
                currentAccountPicture:CircleAvatar(
                  backgroundImage: AssetImage("assets/images/myimage.jpg"),


                ) ,


              ),),
            ListTile(
              leading: Icon(Icons.home,color: Colors.white,),
              title: Text("Home",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w500),),

            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.white,),
              title: Text("Profile",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w500),),

            ),
            ListTile(
              leading: Icon(Icons.mail,color: Colors.white,),
              title: Text("Mail me",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w500),),

            )






          ],

        ),
      ),

    );
  }
}
