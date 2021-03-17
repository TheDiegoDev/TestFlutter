
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Perfil extends StatelessWidget {

  static const String routeName = '/perfil';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
       title: Text("Perfil",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.settings,color: Colors.black,),
            onPressed: () =>  Navigator.pushNamed(context, Routes.ajustes),
          ),
        ],
      ),
      body: PerfilPage(),
    );
  }
}
class PerfilPage extends StatefulWidget{
  @override
  State<PerfilPage> createState()=> PerfilPageState();
}


class PerfilPageState extends State<PerfilPage> {

  // String name;
  // String phone;
  // String mail;

  // Future checkLoguin()async{
  //   final SharedPreferences sharePreferens = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = sharePreferens.getString('name');
  //     phone = sharePreferens.getString('phone');
  //     mail =  sharePreferens.getString('mail');
  //   });
  // }

  // @override
  // void initState()async{
  //   // checkLoguin();
  //   // print(name);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Center(child: Text("name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
        SizedBox(height: 40,),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(Icons.mail,color: Colors.green,),
              SizedBox(width: 10,),
              Text("mail")
            ],),),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Row(
          children: [
            Icon(Icons.phone,color: Colors.green,),
            SizedBox(width: 10,),
            Text("phone")
        ],),),
      ],
    );
  }

}