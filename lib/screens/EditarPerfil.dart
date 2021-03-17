import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class EditarPerfil extends StatelessWidget {

  static const String routeName = '/editarPerfil';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Editar Perfil",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.check,color: Colors.green,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: EditarPerfilPage(),
    );
  }
}
class EditarPerfilPage extends StatefulWidget{
  @override
  State<EditarPerfilPage> createState()=> EditarPerfilPageState();
}


class EditarPerfilPageState extends State<EditarPerfilPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/home.jpg")
                  )
              )),),
        SizedBox(height: 20,),
        Center(child:InkWell(
          onTap: (){

          },
          child: Text("Cambiar imagen de perfil",style: TextStyle(fontSize: 20,color: Colors.lightGreen),),),),
        SizedBox(height: 40,),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "Nombre y apellidos",
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  // hintText: 'EMAIL',
                  // hintStyle: ,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                  labelText: "Correo",
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                  labelText:  "Teléfono",
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              obscureText: true,
            ),

          ],),
        )
      ],),
    );
  }

}