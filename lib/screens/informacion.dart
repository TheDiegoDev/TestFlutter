

import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

class InfoPage extends StatelessWidget{
  static const String routeName = '/info';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: () =>  Navigator.pop(context),),
            ),
        body: Info());
  }
}

class Info extends StatefulWidget{
  @override
  State<Info> createState()=> InfoState();
}


class InfoState extends State<Info> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

  data = ModalRoute.of(context).settings.arguments;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Container(
           padding: EdgeInsets.only(top: 0),
           height: 250,
           width: double.infinity,
           child: Image.network(data["image"],fit: BoxFit.fill,),
         ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Text(data["title"],style: TextStyle(fontSize: 20),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Text(data["price"].toString()+"€",style: TextStyle(color: Colors.green,fontSize: 20),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Text("Descripcion"),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Text(data["desc"],style: TextStyle(color: Colors.black26),),
          ),
          SizedBox(height: 140,),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 40.0,
            width: 150,
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.carrito);
                },
                child: Center(
                  child: Text(
                    "AÑADIR AL CARRITO",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}