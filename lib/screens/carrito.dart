
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

class Carrito extends StatelessWidget {

  static const String routeName = '/carrito';

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Carrito", style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
      ),
      body: CarritoPage(),
    );
  }
}

class CarritoPage extends StatefulWidget{
  @override
  State<CarritoPage> createState()=> CarritoPageState();
}


class CarritoPageState extends State<CarritoPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/home.jpg")
                          )
                      )
                  ),
                  Column(children: [
                    Text("Termomix"),
                    SizedBox(height: 10,),
                    Text("50€"),
                    Row(children: [
                      IconButton(icon: Icon(Icons.remove_circle,color: Colors.green,) , onPressed: (){

                      }),
                      SizedBox(height: 10,),
                      Text("1"),
                      SizedBox(height: 10,),
                      IconButton(icon: Icon(Icons.add_circle,color: Colors.green,) , onPressed: (){
                      })
                    ],)
                  ],)
                ],
              ),
              trailing: Icon(Icons.remove_circle),
              onTap: (){

              },
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/home.jpg")
                          )
                      )
                  ),
                  Column(children: [
                    Text("Termomix"),
                    SizedBox(height: 10,),
                    Text("50€"),
                    Row(children: [
                      IconButton(icon: Icon(Icons.remove_circle,color: Colors.green,) , onPressed: (){

                      }),
                      SizedBox(height: 10,),
                      Text("1"),
                      SizedBox(height: 10,),
                      IconButton(icon: Icon(Icons.add_circle,color: Colors.green,) , onPressed: (){

                      })
                    ],)
                  ],)
                ],
              ),
              trailing: Icon(Icons.remove_circle),
              onTap: (){

              },
            ),
            Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.all(20),
              height: 170,
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
            Container(
                height: 50.0,
                padding: EdgeInsets.all(10),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.pago);
                    },
                    child: Center(
                      child: Text(
                        "SIGUIENTE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ))
          ],)
    );
  }

}