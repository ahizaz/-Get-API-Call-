import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class ExmapleFour extends StatefulWidget {
  const ExmapleFour({super.key});

  @override
  State<ExmapleFour> createState() => _ExmapleFourState();
}

class _ExmapleFourState extends State<ExmapleFour> {
  var data;
  Future<void>getUserApi()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title:Text('Api'),
      ),
      body:Column(
        children: [
          Expanded(child:FutureBuilder(future: getUserApi(), builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text('Loading');
          }else{
            return ListView.builder(itemCount: data.length,itemBuilder: (context,index){

              return Card(
                child:Column(
                  children: [
                    Reusable(title: 'name',value:data[index]['name'].toString(),),
                    Reusable(title: 'username',value:data[index]['username'].toString(),),
                    Reusable(title: 'address',value:data[index]['address']['street'].toString(),),
                  ],
                ),
              );
            });
          }

          }),)
        ],
      ),
    );
  }
}
class Reusable extends StatelessWidget {
  String title,value;
  Reusable({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
