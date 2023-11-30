// import 'package:controle_de_estoque/DAO/item_inherited.dart';
// import 'package:controle_de_estoque/componentes/item_card.dart';
// import 'package:controle_de_estoque/models/item.dart';
// import 'package:controle_de_estoque/views/tela_add_item.dart';
// import 'package:flutter/material.dart';

// class TelaEstoque extends StatefulWidget {
//   const TelaEstoque({super.key});

//   @override
//   State<TelaEstoque> createState() => _TelaEstoqueState();
// }

// class _TelaEstoqueState extends State<TelaEstoque> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Estoque'),
//       ),
//       body: ListView(
//         children: ItemInherited.of(context).listaItens,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (contextNew) => TelaAddItem(
//                         itemContext: context,
//                       )));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:controle_de_estoque/componentes/item_card.dart';
import 'package:controle_de_estoque/views/tela_add_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaEstoque extends StatefulWidget {
  @override
  TelaEstoqueState createState() => TelaEstoqueState();
}

class TelaEstoqueState extends State<TelaEstoque> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Itens').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 70),
              child: ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document =
                      snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                  // Use os dados do documento para exibir na interface do usuário
                  // return ListTile(
                  //   title: Text(document['nome']),
                  //   subtitle: Text(document['quantidade'].toString()),
                  // );
                  return ItemCard(
                      id: document.id,
                      nome: document['nome'],
                      quantidade: document['quantidade'],
                      imagem: document['imagem']);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar os dados do Firestore');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => TelaAddItem(
                        itemContext: context,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
