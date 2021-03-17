

import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

class FirstPage extends StatelessWidget {

  static const String routeName = '/inicio';

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
          title: Text("Logo", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
          centerTitle: true,
      ),
      body: PageOne(),
    );
  }
}
class PageOne extends StatefulWidget{
  @override
  State<PageOne> createState()=> PageOneState();
}


class PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, Routes.gourmet);
              },
              child: Container(
                child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gourmet Delivery\n", style: TextStyle(color: Colors.white,fontSize: 25),),
                    Text("Te llevamos a casa los mejores\n platos Gourment de Alta\n Gastronomia cocinados al Vacio\n Sous-vide a baja temperatura\n por nuestros chefs",
                      style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                  ],),),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, Routes.equipo);
              },
              child: Container(
                child: Center(child: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Equipos para Cocinar\n", style: TextStyle(color: Colors.white,fontSize: 25),),
                    Text("Para cocinar al Vacio Sous-Vide\n a Baja Temperatura y Robots\n diseñados para hacer mas facil y\n practica la buena cocina",
                      style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                  ],),),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home_two.jpg"),
                    fit: BoxFit.cover,
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

