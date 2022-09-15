part of 'login_bloc.dart';

@immutable
abstract class LoginState {}




class LoginInitial extends LoginState {}

class WelcomeState extends LoginState {}

class RegisterState extends LoginState {}

class SignInState extends LoginState {}

class LogInState extends LoginState {}

class HomeState extends LoginState {}
