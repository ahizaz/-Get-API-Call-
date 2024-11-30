import 'package:api/example_five.dart';
import 'package:api/example_four.dart';
import 'package:api/example_three.dart';
import 'package:api/home_screen.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import 'example_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Api Check',
      home: const LastExampleScreen(),
    );

  }
  }
