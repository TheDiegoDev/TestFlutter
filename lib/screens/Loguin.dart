import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/models/Userhelper.dart';
import 'package:prova_flutter_diegoguinea/models/models.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loguin extends StatelessWidget {

  static const String routeName = '/loguin';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      body: LoguinPage(),
    );
  }
}
class LoguinPage extends StatefulWidget{
  @override
  State<LoguinPage> createState()=> LoguinPageState();
}


class LoguinPageState extends State<LoguinPage> {


  UserHelper _userHeper = UserHelper();
  Future<List<UserInfo>> _users;
  Future<UserInfo> _oneUser;
  final mail = TextEditingController();
  final password = TextEditingController();
  List<UserInfo> users;




  @override
  void initState(){
    _userHeper.initializeDatabase().then((value){
      print("---------------DataBase initialized");
      _oneUser = _userHeper.getOneUser(mail.text);
      _users = _userHeper.getUsers();
    });
  }



  bool _secureText = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      Navigator.pushNamed(context, Routes.inicio);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: Column(

          children: [
          Container(

            width: 100,
            height: 100,
            decoration: BoxDecoration(
                 image: DecorationImage(
                 image: AssetImage("assets/logo.png"),
                   fit: BoxFit.cover,
               ),
            ),
          ),
          Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.only(top: 100,left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("¡Hola de nuevo!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ],),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: mail,
                    validator: (value){
                      if(value.isEmpty){
                        return "Wrong input";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "correo@ejemplo.com",
                        labelText: "Correo",
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
                    controller: password,
                    validator: (value){
                      if(value.isEmpty){
                        return "Wrong input";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                        color: Colors.black38),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        suffixIcon: IconButton(
                          icon: Icon( _secureText ?Icons.remove_red_eye_outlined :Icons.remove_red_eye_sharp, color: Colors.green,),
                          onPressed: (){
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        ),
                       ),
                    obscureText: _secureText,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "He olvidado mi contraseña",
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.recuperar);
                            },
                            child: Text(
                              "Recuperar",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: InkWell(
                        onTap: () async {
                          validate();
                         // Navigator.pushNamed(context, Routes.inicio);
                        },
                        child: Center(
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "¿No tienes cuenta?",
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signup);
                        },
                        child: Text(
                          "¡Registrate!",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              )
            ),
          ),
        ],
        ),
      ),
    );

  }
  
}