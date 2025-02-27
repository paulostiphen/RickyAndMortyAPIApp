import 'package:flutter/material.dart';
import 'package:ricky_and_morty_app/models/character.dart';
import 'package:ricky_and_morty_app/services/rm_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Character>> _futureCharacters;
  final RmApiService _rmApiService = RmApiService();
  
  @override
  void initState(){
    super.initState();
    _futureCharacters =  _rmApiService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Ricky and Morty"),
      centerTitle: true,
    ),
    body: FutureBuilder(
     future: _futureCharacters,
     builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError){
          return Center(child: Text("Erro: ${snapshot.error}"));
        }else if (snapshot.hasData){
          final characters = snapshot.data!;

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index){
              final caracter = characters[index];
              return Placeholder();

            }
            );      
            } else {
              const Center(child: Text("Nenhum dado disponível"),);
            }
     }
     ) 
    );
  }
}

