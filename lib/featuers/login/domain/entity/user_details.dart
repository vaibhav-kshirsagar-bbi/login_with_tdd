import 'package:equatable/equatable.dart';

class UserDetails extends Equatable{

  String name;
  num age;
  String userId;
  String password;

  UserDetails({required this.name,required this.age,required this.userId,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [name,age,userId,password];



}