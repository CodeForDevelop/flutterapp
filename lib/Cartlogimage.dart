import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class Catlogimage extends StatelessWidget {
  final String image;
  const Catlogimage({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.color(context.canvasColor).make().py16().px8().w48(context).expand();


  }
}