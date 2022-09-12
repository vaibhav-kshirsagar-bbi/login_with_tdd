import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';

class UserDetailModel extends UserDetails{



  UserDetailModel({required String name,required num age,required String userId,required String password}) : super(name:name, age:age, userId:userId, password:password);


  factory UserDetailModel.fromJson(Map<String,dynamic> json){

    return UserDetailModel(name: json["name"], age: json["age"], userId: json["userId"], password: json ["password"]);

  }

  Map<String,dynamic> toJson(){

    return {

      'name':name,
      'age':age,
      'userId':userId,
      'password':password

    };

  }

}