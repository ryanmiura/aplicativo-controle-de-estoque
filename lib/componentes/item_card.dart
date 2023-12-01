import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_de_estoque/DAO/item_inherited.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String? id;
  final String nome;
  final int quantidade;
  final String imagem;

  const ItemCard(
      {super.key,
      required this.nome,
      required this.quantidade,
      required this.imagem,
      this.id});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
        width: 400,
        height: 80,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const SizedBox(
            width: 0,
          ),
          Container(
            width: 50,
            height: 50,
            child: Image.network(
              widget.imagem,
              fit: BoxFit.cover,
              height: 50,
            ),
          ),
          Text(widget.nome),
          Text("Quantidade : ${widget.quantidade}"),
          IconButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('Itens')
                    .doc(widget.id)
                    .delete();
              },
              icon: const Icon(Icons.delete)),
        ]),
      ),
    );
  }
}
//https://static.wixstatic.com/media/11d2b8_b742b4f1519f476cbeb72e4288fd0b97~mv2.png/v1/fill/w_479,h_316,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/11d2b8_b742b4f1519f476cbeb72e4288fd0b97~mv2.png