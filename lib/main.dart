import 'package:flutter/material.dart';
import 'package:ricky_and_morty_app/screens/home_screen.dart';

void main(){
  runApp(RickyAndMortyApp());
}

class RickyAndMortyApp extends StatelessWidget {
  const RickyAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
