import 'package:flutter/material.dart';
import 'package:flutter_crud/item_provider.dart';
import 'package:provider/provider.dart';


class Lista_Compras extends StatefulWidget {
  @override
  State<Lista_Compras> createState() => _Lista_Compras_State();
}

class _Lista_Compras_State extends State<Lista_Compras> {
  late TextEditingController controller;
  late TextEditingController controller2;


  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Compras'),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 180,
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Criar Itens',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      itemProvider.addItem(controller.text);
                      controller.clear();
                    },
                    child: const Text("Adicionar"),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                        itemCount: itemProvider.itens.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(itemProvider.itens[index].name),
                            leading: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(child: const Text('Update')),
                                      content: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: TextField(
                                              controller: controller2,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text('Cancel', style: TextStyle(color: Colors.red),),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                        TextButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              itemProvider.updateItem(index, controller2.text);
                                              controller2.clear();
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              child: const Text("Alterar"),
                            ),
                            trailing: Wrap(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                  ),
                                  onPressed: () {
                                    itemProvider.deleteItem(index);
                                  },
                                  child: const Text("Deletar"),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
