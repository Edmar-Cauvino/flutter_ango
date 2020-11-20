import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ango/loginEnter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Email", style:
      TextStyle(
        color: Colors.black38, fontSize: 18,
      ),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                ),
              ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress, style: TextStyle(
              color: Colors.black87
          ),
            decoration: InputDecoration(
                hintText: "Digite o email",
                labelStyle: TextStyle(color: Colors.black38, fontSize: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)
                )

            ),
          )

      )
    ],

  );
}

Widget buildPassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Senha", style:
      TextStyle(
        color: Colors.black38, fontSize: 18,
      ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0,2)
              ),
            ]
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress, style: TextStyle(
            color: Colors.black87
        ),

          decoration: InputDecoration(
              hintText: "Senha",
              labelStyle: TextStyle(color: Colors.black38, fontSize: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4)
              )
          ),

        ),
      )

    ],
  );
}

Widget buildLoginBtn(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginEnter(),
            ));
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
      ),
      color: Colors.red,
      child: Text(
        "Entrar", style: TextStyle(
        color: Color(0xfff5efeb),
        fontSize: 20,
      ),
      ),
    ),

  );


}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xfff5efeb),
                          Color(0xfff5efeb),
                          Color(0xfff5efeb),
                          Color(0xfff5efeb),
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("AngoMatriz", style:
                      TextStyle(
                        color: Colors.red, fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "Bem-Vindo! faça o login para acessar  sua conta",
                        style: TextStyle(color: Colors.black38, fontSize: 25,
                        ) ,
                      ),

                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 20),
                      buildLoginBtn(context),


                    ],
                  ),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}




