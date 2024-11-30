import 'dart:convert';

import 'package:api/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Models/PostsModel.dart';
import 'package:http/http.dart'as http;
class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList =[];
  Future<List<UserModel>> getuserApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;

    }else{
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('Api Check'),
      ),
      body:Column(
        children: [
            Expanded(child: FutureBuilder(future: getuserApi(), builder: (context,AsyncSnapshot<List<UserModel>>snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else{
              return ListView.builder(
                
                  itemCount: userList.length, 
                  itemBuilder: (context,index){
                    return Card(
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('name'),

                                Text(snapshot.data![index].name.toString())
                              ],
                            ),
                          ],
                        ),
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

