import 'package:hive/hive.dart';

import 'model.dart';

class ItemRepository{
  static String boxName = "itemBox";
  Box<Item> box = Hive.box(boxName);
  static openBox () async{await Hive.openBox<Item>(boxName);}

  Future create({required Item item}) async {
    await box.add(item);
  }

  Future delete({required int idx}) async {
    await box.deleteAt(idx);
  }

  Future update({required int idx,required Item item}) async{
    await box.putAt(idx, item);
  }

  Future<List<Item>> getAll() async{
    return box.toMap().values.toList();
  }

}