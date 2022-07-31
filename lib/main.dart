import 'package:flutter/material.dart';
import 'package:flutter_crud/item_provider.dart';
import 'package:flutter_crud/repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'model.dart';

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  await ItemRepository.openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ItemProvider()),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Lista_Compras(),
      ),
    );
  }
}