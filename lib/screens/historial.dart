import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

class Historial extends StatelessWidget {

  static const String routeName = '/historial';

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Historial de pedidos", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
      ),
      body: HistorialPage(),
    );
  }
}

class HistorialPage extends StatefulWidget{
  @override
  State<HistorialPage> createState()=> HistorialPageState();
}


class HistorialPageState extends State<HistorialPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text("20 de mayo de 2020",style: TextStyle(color: Colors.grey),),
                subtitle: Text("Pedido #JQS100"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total 120,00€"),
                    Text("En camino",style: TextStyle(color: Colors.green),)
                  ],
                ),),
            ],
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text("18 de mayo de 2020",style: TextStyle(color: Colors.grey),),
                subtitle: Text("Pedido #JQS300"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total 30,00€"),
                    Text("En camino",style: TextStyle(color: Colors.green),)
                  ],
                ),),
            ],
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text("2 de mayo de 2020",style: TextStyle(color: Colors.grey),),
                subtitle: Text("Pedido #JQS200"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total 30,00€"),
                    Text("Entregado",style: TextStyle(),)
                  ],
                ),),
            ],
          ),
        ),
      ],
    );
  }
  }