import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CambiarContra extends StatelessWidget {

  static const String routeName = '/cambiarContra';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cambiar contraseña",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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
      body: CambiarContraPage(),
    );
  }
}
class CambiarContraPage extends StatefulWidget{
  @override
  State<CambiarContraPage> createState()=> CambiarContraPageState();
}


class CambiarContraPageState extends State<CambiarContraPage> {

  bool _secureText = true;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon( _secureText ?Icons.remove_red_eye_outlined :Icons.remove_red_eye_sharp, color: Colors.green,),
                  onPressed: (){
                    setState(() {
                      _secureText = !_secureText;
                    });
                  },
                ),
                labelText: "Contraseña",
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))

            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon( _secureText ?Icons.remove_red_eye_outlined :Icons.remove_red_eye_sharp, color: Colors.green,),
                  onPressed: (){
                    setState(() {
                      _secureText = !_secureText;
                    });
                  },
                ),
                labelText: "Repetir contraseña",
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))

            ),
          ),
        ],),
      )
    );
  }

}