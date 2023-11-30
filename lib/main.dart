import 'package:controle_de_estoque/DAO/item_inherited.dart';
import 'package:controle_de_estoque/views/tela_estoque.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 27, 126)),
        useMaterial3: true,
      ),
      home: ItemInherited(child: TelaEstoque()),
    );
  }
}
