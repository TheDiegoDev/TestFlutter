
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

class Pago extends StatelessWidget {

  static const String routeName = '/pago';

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Pago", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
      ),
      body: PagoPage(),
    );
  }
}

class PagoPage extends StatefulWidget{
  @override
  State<PagoPage> createState()=> PagoPageState();
}


class PagoPageState extends State<PagoPage> {


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            Center(child: Text("La entrega se realizará en 24-72 horas",style: TextStyle(color: Colors.grey),),),
            Container(
              padding: EdgeInsets.all(20),
              height: 150,
              width: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Precio",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("100€",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold))
                    ],),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gastos de envio",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("5€",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold))
                    ],),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Precio Total",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                      Text("125€",textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
                    ],)
                ],
              ),
            ),
            Divider(color: Colors.black),
            Form(
              key: formkey,
              child:  Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "Wrong input";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Dirección de entrega",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "Wrong input";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Numero de télefono",
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Número de la tarjeta",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                    SizedBox(height: 10,),
                    Text("Aún no has añadido ninguna tarjeta",style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.tarjeta);
                      },
                      child: Text(
                        "AÑADIR TARJETA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen),
                      ),
                    )
                  ],
                ),
              ),),
            SizedBox(height: 20,),
            Container(
                height: 50.0,
                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      validate();
                    },
                    child: Center(
                      child: Text(
                        "PAGAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
          ],)
    );
  }

}