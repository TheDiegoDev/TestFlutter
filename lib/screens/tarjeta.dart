import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';


class Tarjeta extends StatelessWidget {

  static const String routeName = '/tarjeta';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Añadir tarjeta", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
      ),
      body: TarjetaPage(),
    );
  }
}

class TarjetaPage extends StatefulWidget {
  @override
  _TarjetaPageState createState() => _TarjetaPageState();
}

class _TarjetaPageState extends State<TarjetaPage> {


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.lightGreen,
                        elevation: 7.0,
                        child: Container(
                          width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child:Text("XXXX XXXX XXXX XXXX",style: TextStyle(color: Colors.white,fontSize: 20),) ,),
                                Container(
                                  padding: EdgeInsets.only(top: 20,left: 10),
                                  child:Text("MM/YY",style: TextStyle(color: Colors.white,fontSize: 20),) ,),
                                Container(
                                  padding: EdgeInsets.only(top: 40,left: 10),
                                  child:Text("Card Holder",style: TextStyle(color: Colors.white,fontSize: 20),) ,),
                              ],
                            ),
                          ),

                      )),
                  Form(
                    key: formkey,
                    child: Container(
                        padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10,),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Wrong input";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Numero de tarjeta",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  // hintText: 'EMAIL',
                                  // hintStyle: ,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),
                            ),
                            SizedBox(height: 5.0),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Wrong input";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText:  "Fecha de caducidad",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),
                            ),
                            SizedBox(height: 5.0),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Wrong input";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "CVV",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),
                            ),
                            SizedBox(height: 5.0),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Wrong input";
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Titular de la tarjeta",
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                                height: 40.0,
                                // padding: EdgeInsets.only(bottom: 50),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  child: InkWell(
                                    onTap: () async{
                                      validate();
                                      // Navigator.pushNamed(context, Routes.inicio);
                                    },
                                    child: Center(
                                      child: Text(
                                        "AÑADIR",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        )),),
                ])
        ));
  }
}
