import 'package:filmes/get_filmes.dart';
import 'package:filmes/lista_filmes.dart';
import 'package:filmes/model_filmes.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Future<List<Filmes>>? futureFilmes;

    @override
    void initState() {
      futureFilmes = getFilmes();
      super.initState();
      
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes Studio"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureFilmes,
        builder: (context, snapshot){
          if(snapshot.hasData){
            final filmes = snapshot.data as List<Filmes>;
            return ListaFilmes(filmes: filmes);
          }else if (snapshot.hasError){
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        ),
    );
  }
}