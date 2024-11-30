import 'dart:convert';

import 'package:api/Models/Procucts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({super.key});

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {

  Future<Procucts> getproducts() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/ce92d62b-ecbc-4c1f-bb97-3051f2092989'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Procucts.fromJson(data);
    } else {
      return Procucts.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api'),
      ),
      body:Column(
        children: [
          Expanded(child: FutureBuilder(future: getproducts(), builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(itemCount :snapshot .data!.data!.length ,
                  itemBuilder:(context,index){
                return Column(
                children: [
                  Container(
                    height :MediaQuery.of(context).size.height*.3,
                     width : MediaQuery.of(context).size.width*.2,
                     child:ListView.builder(scrollDirection :Axis.horizontal ,itemCount: snapshot.data!.data![index].images!.length,itemBuilder: (context,position){
                       return Container(
                         height :MediaQuery.of(context).size.height*.25,
                         width : MediaQuery.of(context).size.width*.5,
                         decoration:BoxDecoration(
                           image:DecorationImage(image:NetworkImage(snapshot.data!.data![index].images![position].url.toString()) ),
                         ),
                       );

                     }),
                  )
                ],
                );
              });
            }else return Text('Loading');
            
          }),
          )
        ],
      ),
    );
  }
}


