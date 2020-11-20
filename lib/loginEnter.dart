import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ango/loginHome.dart';
import 'package:flutter_ango/loginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ango/variavel.dart';

const request= "https://angomatriz.com/api/documents";
var remetente;
var assunto;
var data;
var foto;
var id;




class LoginEnter extends StatefulWidget {

  @override
  _LoginEnterState createState() => _LoginEnterState();

}

class User {
  final int id;
  final String inst;
  final String assunto;
  final String cod;
  final String foto;

  User(this.id, this.inst, this.assunto, this.cod, this.foto);
}

class _LoginEnterState extends State<LoginEnter> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => LoginScreen(),
            )
            );},
        ),
        backgroundColor: Colors.red,
        title: Text("Principal"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: () {},

          )
        ],

      ),
      drawer: Drawer(),

      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginHome(),
              ));
        },
        child: Icon(Icons.border_color),
        backgroundColor: Colors.red,
      ),
      body:
     // SingleChildScrollView(
         Container(
          child:
          FutureBuilder<List<User>>(
            future: _getListApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child:Text("..." , style: TextStyle(
                      fontSize: 30
                    ),),
                  ),
                );
              }else{

                return ListView.builder(
                    itemCount:snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      id = snapshot.data[index].id;
                      remetente = snapshot.data[index].inst;
                      assunto = snapshot.data[index].assunto;
                      data = snapshot.data[index].cod;
                      foto = snapshot.data[index].foto;
                      //var a = users[index];
                      return topTail(Title: remetente, Subtitle: assunto, idata: data, Foto: foto);
                  }
                );

              }

            },

          ),
        ),
      //)

    );
  }

 Future <List<User>> _getListApi() async {
    var response = await http.get(request);
    var dadosJson = json.decode(response.body);

    List <User> users = [];

    for(var u in dadosJson["resultado"]){
      User user = User(u["id"], u["inst"], u["assunto"], u["cod"], u["foto"]);

      users.add(user);
    }

    return users;
  }


  ListTile topTail({int Id, String Title, String Subtitle, String idata, String Foto }) {
    return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://angomatriz.com/storage/app/public/perfil/"+Foto),
          ),

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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => LoginHome(),
        )
        );
        nome = Title;
        assunto2=Subtitle;
        ID=idata;
        id=Id;
        Foto=Foto;

      },
    );

  }



  }

