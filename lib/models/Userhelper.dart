import 'package:sqflite/sqflite.dart';

import 'models.dart';

final String tableName = 'users';
final String columnId = 'id';
final String columnName = 'name';
final String columnTlf = 'phone';
final String columnMail = 'mail';
final String columnContra = 'password';


class UserHelper{

 static Database _database;
 static UserHelper _userHelper;

 UserHelper._createInstance();
 factory UserHelper(){
   if(_userHelper == null){
     _userHelper = UserHelper._createInstance();
   }
   return _userHelper;
 }

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    var dir = await getDatabasesPath();
    var path = dir + "user.db";

    var database = await openDatabase(
        path,
      version: 1,
      onCreate: (db,version){
          db.execute('''
          create table $tableName (
          $columnId integer primary key autoincrement,
          $columnName text not null,
          $columnTlf text not null,
          $columnMail text not null,
          $columnContra text not null)
          ''');
      },
    );
    return database;
  }

  void insertUser(UserInfo userInfo) async {
   var db = await this.database;
   var result = await db.insert(tableName, userInfo.toMap());
   print(result);
  }


 Future<bool> userExist(String mail) async{
   var db = await this.database;
   var result = await db.query(tableName);
   result.forEach((element) {
     var userInfo = UserInfo.fromMap(element);
     if(userInfo.mail == mail){
       return true;
     }else{
       return false;
     }
   });
 }

 Future<UserInfo> getOneUser(String mail) async{
   UserInfo _user;

   var db = await this.database;
   var result = await db.query(tableName);
   result.forEach((element) {
     var userInfo = UserInfo.fromMap(element);
     if(userInfo.mail == mail){
       return userInfo;
     }
   });
 }

  Future<List<UserInfo>> getUsers() async{
   List<UserInfo> _users = [];
   
   var db = await this.database;
   var result = await db.query(tableName);
   result.forEach((element) {
     var userInfo = UserInfo.fromMap(element);
     _users.add(userInfo);
   });

   return _users;
  }

}