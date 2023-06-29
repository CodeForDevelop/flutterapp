import 'package:flutter/material.dart';

import 'cartlog.dart';
import 'package:velocity_x/velocity_x.dart';
class Detail extends StatelessWidget {
  final item catlog;
  const Detail({Key? key,required this.catlog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$ ${ catlog.prices}".text.bold.xl4.red800.make(),
          ElevatedButton(onPressed: (){



          },style: ButtonStyle(
            shape:MaterialStateProperty.all(const StadiumBorder()) ,

          ),
            child:"Add to cart".text.make(),


          ).wh(120, 50)
        ],




      ).p32(),
      appBar: AppBar(
          backgroundColor:Colors.transparent
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
          child: Column(
            children: [
              Hero(tag: Key(catlog.id.toString()),child: Center(child: Image.network(catlog.image))).h32(context),
              Expanded(child: VxArc(
                height: 30.0,
                arcType: VxArcType.convex,
                edge: VxEdge.top,
                child: Container(color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(

                      children: [


                        catlog.name.text.xl4.color(context.accentColor).bold.make(),
                        catlog.desc.text.xl.color(context.accentColor).make(),
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.".text.color(context.accentColor).make().p16()
                      ],



                    ).py64()
                ),
              ))


            ],


          )
      ),




    );
  }
}
