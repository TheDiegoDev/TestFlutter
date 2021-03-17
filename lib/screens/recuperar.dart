import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recuperar extends StatelessWidget {

  static const String routeName = '/recuperar';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      body: RecuperarPage(),
    );
  }
}

class RecuperarPage extends StatefulWidget {
  @override
  _RecuperarPageState createState() => _RecuperarPageState();
}

class _RecuperarPageState extends State<RecuperarPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      padding: EdgeInsets.only(left: 20,top: 50),
                      // padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        "Ayudanos a recuperar\ntu contraseña",
                        style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ],),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      padding: EdgeInsets.only(left: 20,top: 20),
                      // padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        "Introduce tu correo y te enviaremos las\ninstrucciones para poder recuperarla",
                        style: TextStyle(
                          fontSize:15,),
                      ),
                    ),
                  ],),
                  Container(
                      padding: EdgeInsets.only(top: 60, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                hintText: "correo@ejemplo.com",
                                labelText: "Correo",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                          ),
                          SizedBox(height: 150.0),
                          Container(
                              height: 40.0,
                              // padding: EdgeInsets.only(bottom: 50),
                              child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Center(
                                    child: Text(
                                      "ENVIAR",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )),
                ])
        ));
  }
}
