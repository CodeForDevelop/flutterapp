import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'cartlog.dart';
import 'themew.dart';
import 'Cartlogimage.dart';
class Catlogitem extends StatefulWidget {
  final item catlog;

  const Catlogitem({Key? key, required this.catlog}) : super(key: key);

  @override
  State<Catlogitem> createState() => _CatlogitemState();
}

class _CatlogitemState extends State<Catlogitem> {
  bool isadded= false;

  @override
  Widget build(BuildContext context) {
    return VxBox(child: Row(children: [
      Hero(tag: Key(widget.catlog.id.toString()),


          child: Catlogimage(image: widget.catlog.image
          )),
      const SizedBox(width: 10,),
      Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          widget.catlog.name.text.xl2
              .color(context.accentColor)
              .bold
              .make(),
          widget.catlog.desc.text.color(Mytheme.darkBluishColor).make(),
          ButtonBar(alignment: MainAxisAlignment.spaceBetween,

            children: [
              "\$ ${ widget.catlog.prices}".text
                  .color(context.accentColor)
                  .bold
                  .xl
                  .make(),
              ElevatedButton(onPressed: () {
                   isadded =isadded.toggle();

              }, style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),

              ),
                child: isadded? Icon(Icons.done):"Add to Cart".text.make(),


              )
            ],
          )


        ],
      ))

    ],))
        .color(context.cardColor)
        .roundedLg
        .square(100)
        .make()
        .p16()
        .h32(context);
  }
}