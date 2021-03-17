
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/models/models.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';


class EquipoCocina extends StatelessWidget {

  static const String routeName = '/equipo';

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Productos", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search,color: Colors.black54,),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.timelapse,color: Colors.black54,),
            onPressed: () => Navigator.pushNamed(context, Routes.historial),
          ),
        ],
      ),
      body: Equipo(),
    );
  }
}

class Equipo extends StatefulWidget{
  @override
  State<Equipo> createState()=> EquipoState();
}


class EquipoState extends State<Equipo> {

  Future<List<Objects>> _listado;
  List<String> photos = [
    "assets/cook.png",
    "assets/pan.png",
    "assets/ricecooker.png",
    "assets/termo.png"
  ];
  List<String> names = [
    "Ollas",
    "Sartenes",
    "Arroceras",
    "Termos"
  ];


  @override
  void initState(){
    super.initState();
    _listado = _getList();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:FutureBuilder(
       future: _listado,
       builder: (context, snapshot) {
         if(snapshot.hasData){
           print(snapshot.data);
           return Column(children: [
             Row(children: [
               Expanded(child: Container(height: 70,width: double.infinity,
                 child: ScrollSnapList(
                   initialIndex: 3,
                   itemBuilder: _buildItemList,
                   itemSize: 50,
                   dynamicItemSize: true,
                   scrollDirection: Axis.horizontal,
                   itemCount: photos.length,
                 ),
               ))
             ],),
             Expanded(child: GridView.count(
               crossAxisCount: 2,
               children: _listConsum(snapshot.data),
             ),),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                   height: 40,width: 100,
                   child: Material(
                     color: Colors.lightGreen,
                     borderRadius: BorderRadius.circular(5.0),
                     child: Row(
                       children: [
                         IconButton(icon: Icon(Icons.person, color: Colors.white,), onPressed: (){
                           Navigator.pushNamed(context, Routes.perfil);
                         }),
                         IconButton(icon: Icon(Icons.shopping_cart_rounded,color: Colors.white,), onPressed: (){
                           Navigator.pushNamed(context, Routes.carrito);
                         })
                       ],),),)
               ],)
           ],);
         }else if (snapshot.hasError){
           print(snapshot.error);
           return Text("Error");
         }
         return Center(child: CircularProgressIndicator());
       },
     ),
   );
  }

  Future<List<Objects>> _getList() async {

    final respuesta = await http.get(Uri.parse("https://www.dropbox.com/s/pp00y8b8boqozis/archivo.json?dl=1"),);

    List<Objects> consum = [];

    if(respuesta.statusCode == 200){
      String datos = utf8.decode(respuesta.bodyBytes);
      final jsonData = jsonDecode(datos);
      for(var item in jsonData["users"]){
        if(item["type"] == 1){
          consum.add(
              Objects(item["title"],item["id"],item["image"],item["description"],item["price"],item["type"])
          );
        }
      }
      return consum;
    }else{
      throw Exception("Fallo la consexion");
    }
  }

  Widget _buildItemList(BuildContext context,int index){
    return Container(
      width: 70,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){

              },
              child: Container(
                color: Colors.black,
                width: 50,
                height: 50,
                child: Image.asset(photos[index]),
              )),
          Text(names[index])
        ],),
    );
  }


  List<Widget> _listConsum(List<Objects> data){
    List<Widget> products = [];

    for(var item in data){
      products.add(
          Card(child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.info, arguments: {
                'image': item.image,
                'title': item.title,
                'price': item.price,
                'desc': item.description
              });
            },
            child: Column(
              children: [
                Expanded(child: Image.network(item.image, fit: BoxFit.fill,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(item.price.toString() + "€",style: TextStyle(color: Colors.green),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text(item.title)
                  ],),
                ),
              ],
            ),
          ))
      );
    }
    return products;
  }


}