/*import 'dart:convert';

class Catlogmodel {
  static List<item> items=[];

  // Get Item by ID
  static item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  static item getByPosition(int pos) => items[pos];
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

  item copyWith({
    required int id,
    required String name,
    required String desc,
    required num prices,
    required String color,
    required String image,
  }) {
    return item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      prices: prices ?? this.prices,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'prices': prices,
      'color': color,
      'image': image,
    };
  }

  factory item.fromMap(Map<String, dynamic> map) {


    return item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      prices: map['prices'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory item.fromJson(String source) => item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, prices: $prices, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.prices == prices &&
        o.color == color &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    desc.hashCode ^
    prices.hashCode ^
    color.hashCode ^
    image.hashCode;
  }
}*/