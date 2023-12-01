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
        title: const Text('Estoque'),
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
