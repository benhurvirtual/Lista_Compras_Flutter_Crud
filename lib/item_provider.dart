import 'package:flutter/material.dart';
import 'package:flutter_crud/repository.dart';

import 'model.dart';

class  ItemProvider with ChangeNotifier{
  final ItemRepository itemRepository = ItemRepository();
  ItemProvider(){
    refresh();
  }
  final List<Item> itens = [];
  refresh(){
    itemRepository.getAll().then((value){
      itens.clear();
      itens.addAll(value);
      notifyListeners();
    });
  }
  addItem(String name) async{
    var myitem = Item(name: name);
    await itemRepository.create(item: myitem);
    refresh();
  }
  updateItem(int index, String name) async{
    var myitem = Item(name: name);
    await itemRepository.update(idx: index,item: myitem);
    refresh();
  }
  deleteItem(int index) async{
    await itemRepository.delete(idx: index);
    refresh();
  }
}