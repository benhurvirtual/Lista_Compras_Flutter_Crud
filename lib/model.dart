import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject{
  @HiveField(0)
  String name;
  Item({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };

  static Item fromJson(Map<String,dynamic> json) => Item(
    name: json['name'],
  );
}

