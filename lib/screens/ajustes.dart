
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

class Ajustes extends StatelessWidget {

  static const String routeName = '/ajustes';

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Ajustes", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
      ),
      body: AjustesPage(),
    );
  }
}

class AjustesPage extends StatefulWidget{
  @override
  State<AjustesPage> createState()=> AjustesPageState();
}


class AjustesPageState extends State<AjustesPage> {
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.only(top: 10),
       child: ListView(
       children: <Widget>[
         ListTile(
          title: Text('Editar Perfil'),
           trailing: Icon(Icons.keyboard_arrow_right),
           onTap: (){
             Navigator.pushNamed(context, Routes.editarPerfil);
           },
          ),
           ListTile(
             title: Text('Cambiar contraseña'),
             trailing: Icon(Icons.keyboard_arrow_right),
             onTap: (){
               Navigator.pushNamed(context, Routes.cambiarContra);
             },
           ),
           ListTile(
             title: Text('Terminos y condiciones'),
             trailing: Icon(Icons.keyboard_arrow_right),
           ),
         ListTile(
           title: Text('Politica de privacidad'),
           trailing: Icon(Icons.keyboard_arrow_right),
         ),
         ListTile(
           title: Text('Informacion'),
           trailing: Icon(Icons.keyboard_arrow_right),
           onTap: (){
             Navigator.pushNamed(context, Routes.infoApp);
           },
         ),
         ListTile(
           title: Text('Cerrar sesión',style: TextStyle(fontWeight: FontWeight.bold),),
           onTap: (){
             Navigator.pushNamed(context, Routes.loguin);
           },
         ),
          ],)
   );
  }

}