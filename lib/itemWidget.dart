import 'package:flutter/material.dart';
import 'cartlog.dart';
class itemWidget extends StatelessWidget {
  final item Item;

  const itemWidget({Key? key, required this.Item})
      :assert(Item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
          onTap: () {
            print("${Item.name} pressed");
          },
          leading: Image.network(Item.image),
          title: Text(Item.name),
          subtitle: Text(Item.desc),
          trailing: Text(
            "\$${Item.prices}",
            textScaleFactor: 1.5,
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold


            ),


          )


      ),
    );
  }
}