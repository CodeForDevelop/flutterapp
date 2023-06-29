import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "MY SHOP APP".text.xl5.bold.color(context.accentColor).make(),


        "Trending Products".text.xl2.make()

      ],

    );
  }
}