import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ricky_and_morty_app/models/character.dart';

class RmApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse("$baseUrl/character"));
    
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      final List results = data ['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    }else{
      throw Exception("Falha ao carregar os personagens.");
    }
  }
}
