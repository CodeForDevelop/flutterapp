import 'dart:convert';

class Catlogmodel{

  static List<item> items=[];


}

class item {
  final int id;
  final String name;
  final String desc;
  final num prices;
  final String color;
  final String image;

item({
    required this.id,
    required this.name,
    required this.desc,
    required  this.prices,
    required this.color,
    required this.image,
  });



  factory item.fromMap(Map<String, dynamic> map) {   return item(
  id: map['id'],
  name: map['name'],
  desc: map['desc'],
  prices: map['prices'],
  color: map['color'],
  image: map['image'],
  );

  }

  }

