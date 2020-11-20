import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ango/loginEnter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ango/variavel.dart';

var request="https://angomatriz.com/api/documents/2";
var remetente;
var assunto;
var data;
var foto;


class LoginHome extends StatefulWidget {
  /* Declare a field that holds the Todo.
  final User user;

  // In the constructor, require a Todo.
  LoginHome({Key key, @required this.user}) : super(key: key);*/

  @override
  _LoginHomeState createState() => _LoginHomeState();
}
/*
class User {
  final int id;
  final String inst;
  final String assunto;
  final String cod;
  final String foto;

  User(this.id, this.inst, this.assunto, this.cod, this.foto);
}*/




class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginEnter(),
                ));
          },
        ),

        backgroundColor: Colors.red,
        actions: <Widget>[

          IconButton(icon: Icon(Icons.more_vert),
            onPressed: () {},

          )

        ],

      ),
      body:
      Container(
        child:
          FutureBuilder<Map>(
            future: listApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child:Text("Carregando..", style: TextStyle(
                      fontSize: 30,
                    ),),
                  ),
                );
              }else{
                remetente = nome;
                assunto =assunto2;
                data = snapshot.data["resultado"][0]["cod"];
                return topTail(Title: remetente, Subtitle: assunto, idata: data);
              }
            },
          ),
      ),
      );

  }


  Future <Map> listApi() async {
    var response = await http.get(request);
    return json.decode(response.body);
  }



  ListTile topTail({String Title, String Subtitle, String idata, Color IColor }) {
    return ListTile(


      title: Text(
        Title,
        style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15,
        ),

      ),
      subtitle: Text(
        Subtitle,
        style: TextStyle(
            fontWeight: FontWeight.bold
        ),

      ),
      trailing: Container(
        child: Text(idata.toString(), style: TextStyle(fontSize: 13),),


      ),
    );








  }











  }



