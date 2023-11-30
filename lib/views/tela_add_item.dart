// import 'package:controle_de_estoque/DAO/item_inherited.dart';
// import 'package:flutter/material.dart';

// class TelaAddItem extends StatefulWidget {
//   const TelaAddItem({super.key, required this.itemContext});

//   final BuildContext itemContext;

//   @override
//   State<TelaAddItem> createState() => _TelaAddItemState();
// }

// class _TelaAddItemState extends State<TelaAddItem> {
//   TextEditingController nomeController = TextEditingController();
//   TextEditingController qtdController = TextEditingController();
//   TextEditingController imgController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Scaffold(
//           backgroundColor: Colors.grey[300],
//           appBar: AppBar(
//             title: const Text('Adicionar Item'),
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Container(
//                 width: 590,
//                 height: 500,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Column(children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Insira um nome';
//                           }
//                           return null;
//                         },
//                         controller: nomeController,
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.text,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Nome",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Insira uma quantidade';
//                           }
//                           return null;
//                         },
//                         controller: qtdController,
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Quantidade",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Insira uma imagem';
//                           }
//                           return null;
//                         },
//                         controller: imgController,
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.text,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Imagem",
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 150,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         print(nomeController.text);
//                         print(qtdController.text);
//                         print(imgController.text);
//                         ItemInherited.of(widget.itemContext).novoItem(
//                             nomeController.text,
//                             int.parse(qtdController.text),
//                             imgController.text);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Cadastrando item'),
//                           ),
//                         );
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: Text("Adicionar"),
//                     style: ElevatedButton.styleFrom(
//                       textStyle:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       minimumSize: Size(350, 50),
//                       primary: const Color.fromARGB(255, 106, 240, 111),
//                       onPrimary: Colors.white,
//                       onSurface: Colors.blue,
//                       shadowColor: Colors.grey,
//                       elevation: 5,
//                       side: BorderSide(
//                           color: Colors.greenAccent.shade400,
//                           width: 2,
//                           style: BorderStyle.solid),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       tapTargetSize: MaterialTapTargetSize.padded,
//                     ),
//                   )
//                 ]),
//               ),
//             ),
//           )),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_de_estoque/DAO/item_inherited.dart';
import 'package:flutter/material.dart';

class TelaAddItem extends StatefulWidget {
  const TelaAddItem({super.key, required this.itemContext});

  final BuildContext itemContext;

  @override
  State<TelaAddItem> createState() => _TelaAddItemState();
}

class _TelaAddItemState extends State<TelaAddItem> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController qtdController = TextEditingController();
  TextEditingController imgController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text('Adicionar Item'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 590,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira um nome';
                          }
                          return null;
                        },
                        controller: nomeController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nome",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma quantidade';
                          }
                          return null;
                        },
                        controller: qtdController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Quantidade",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma imagem';
                          }
                          return null;
                        },
                        controller: imgController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Imagem",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String nome = nomeController.text;
                        int quantidade = int.parse(qtdController.text);
                        String imagem = imgController.text;

                        await FirebaseFirestore.instance
                            .collection('Itens')
                            .add({
                          'nome': nome,
                          'quantidade': quantidade,
                          'imagem': imagem,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastrando item'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Adicionar"),
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      minimumSize: Size(350, 50),
                      primary: const Color.fromARGB(255, 106, 240, 111),
                      onPrimary: Colors.white,
                      onSurface: Colors.blue,
                      shadowColor: Colors.grey,
                      elevation: 5,
                      side: BorderSide(
                          color: Colors.greenAccent.shade400,
                          width: 2,
                          style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  )
                ]),
              ),
            ),
          )),
    );
  }
}
