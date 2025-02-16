import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String? id;
  final String nome;
  final int quantidade;
  final String imagem;

  const ItemCard({
    super.key,
    required this.nome,
    required this.quantidade,
    required this.imagem,
    this.id,
  });

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 8),
            Container(
              width: 50,
              height: 50,
              child: _buildImage(),
            ),
            Text(widget.nome),
            Text("Quantidade: ${widget.quantidade}"),
            IconButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('Itens')
                    .doc(widget.id)
                    .delete();
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        widget.imagem,
        fit: BoxFit.cover,
        height: 50,
        width: 50,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
          );
        },
      ),
    );
  }
}
