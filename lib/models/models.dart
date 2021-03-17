import 'dart:convert';

class Objects{
  String title;
  String id;
  String image;
  String description;
  int price;
  int type;

  Objects(title, id, image, description, price, type){

    this.title = title;
    this.id = id;
    this.image = image;
    this.description = description;
    this.price = price;
    this.type = type;

  }
}

// UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));
// String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo{

  int id;
  String name;
  String phone;
  String mail;
  String password;

    UserInfo({this.id, this.name, this.phone, this.mail, this.password});

    factory UserInfo.fromMap(Map<String, dynamic> json) => UserInfo(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      mail: json['mail'],
      password: json['password'],
    );

    Map<String, dynamic> toMap() => {
      "id": id,
      "name": name,
      "phone": phone,
      "mail": mail,
      "password": password,
    };
}