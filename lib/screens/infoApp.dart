import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:package_info/package_info.dart';

class InfoApp extends StatelessWidget {

  static const String routeName = '/infoApp';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Informacion",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,),onPressed: () =>  Navigator.pop(context),),
      ),
      body: InfoAppPage(),
    );
  }
}
class InfoAppPage extends StatefulWidget{
  @override
  State<InfoAppPage> createState()=> InfoAppPageState();
}
class PackageInfoApi{
  static Future<String> getAppVersion() async{
    final packageInfo = await PackageInfo.fromPlatform();
    return"Version ${packageInfo.version}";
  }
}

Future<String> getAppVersion() async{
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

class InfoAppPageState extends State<InfoAppPage> {
  Future<String> appVersion;

  @override
  void initState(){
    super.initState();
    appVersion = getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: Center(
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
            SizedBox(height: 20,),
            Container(
              child: FutureBuilder<String>(
                  future: appVersion,
                  builder: (context, snapshot){
                    if(snapshot.hasData) {
                      return Container(margin:EdgeInsets.all(15.0),child:Center(child:Text("Version "+snapshot.data),),);
                    }else if(snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }
              ),
            ),
            Container(padding: EdgeInsets.all(20),child:
            Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.")
              ,)

          ],
        ),
      ),
      ),
    );

  }

}