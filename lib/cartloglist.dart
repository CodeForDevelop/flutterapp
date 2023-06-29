import 'package:flutter/material.dart';

import 'cartlog.dart';
import 'package:untitled11/Screeen.dart';
import 'cartlogitem.dart';
import 'Detail.dart';
class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(

        shrinkWrap: true,
        itemCount: Catlogmodel.items.length,
        itemBuilder: (context, index) {
          final catlog = Catlogmodel.items[index];
          return InkWell( onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Detail(catlog: catlog,)));

          },

              child: Catlogitem(catlog: catlog));
        });
    }

  }


