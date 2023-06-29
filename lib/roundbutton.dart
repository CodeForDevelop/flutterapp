
import 'dart:async';

import 'package:flutter/material.dart';
class RoundButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Color colors;
  final Color color;


  const RoundButton({Key? key,
  required this.title,
    required this.onTap,
    required this.colors,
    required this.color,

   this.loading =false,

  }) : super(key: key);

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {


  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: widget.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: widget.colors,
          borderRadius: BorderRadius.circular(10)

        ),
        child: Center(child: widget.loading?  CircularProgressIndicator( color: Colors.white,strokeWidth: 5,):
           Text(widget.title,style: TextStyle(color: widget.color),)),







      ),
    );
  }
}



