import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/models/Userhelper.dart';
import 'package:prova_flutter_diegoguinea/models/models.dart';
import 'package:prova_flutter_diegoguinea/screens/perfil.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatelessWidget {

  static const String routeName = '/signup';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      body: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final name = TextEditingController();
  final phone = TextEditingController();
  final mail = TextEditingController();
  final password = TextEditingController();

  UserHelper _userHeper = UserHelper();


  @override
  void initState() {
    _userHeper.initializeDatabase().then((value){
      print("---------------DataBase initialized");
    });
  }

  bool _secureText = false;
  bool  _checkbox = true;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate()async{
    if(formkey.currentState.validate()){
      if(_checkbox){
        final SharedPreferences sharePreferens = await SharedPreferences.getInstance();
        sharePreferens.setString('name', name.text);
        sharePreferens.setString('phone', phone.text);
        sharePreferens.setString('mail', mail.text);
        var userInfo = UserInfo(
          name: name.text,
          phone: phone.text,
          mail: mail.text,
          password: password.text,
        );
        _userHeper.insertUser(userInfo);
        print(userInfo);
        Navigator.pushNamed(context, Routes.inicio);
      }else{
        setState(() {
          _checkbox = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       // resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
           Container(
            padding: EdgeInsets.only(top: 50),
            child: Stack(
              children: <Widget>[
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
              ],
            ),
          ),
          Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                    child: Text(
                      "¡Te damos la bienvenida!",
                      style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: name,
                    validator: (value){
                      if(value.isEmpty){
                        return "Wrong input";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Nombre y apellidos",
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
                    controller: phone,
                    validator: (value){
                      if(value.isEmpty){
                        return "Wrong input";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText:  "Teléfono",
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
                    controller: mail,
                    validator: (value){
                      if(value.isEmpty){
                        return "Wrong input";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Correo",
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
                    controller: password,
                    validator: (value){
                      if(value.isEmpty){
                        return "Wrong input";
                      }else{
                        return null;
                      }
                    },
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
                    obscureText: _secureText,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _checkbox,
                        //checkColor: Colors.green,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      Text("Aceptar terminos y condiciones",style: TextStyle(decoration: TextDecoration.underline,),),
                    ],
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
                              "SIGN IN",
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
