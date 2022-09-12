part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}



class RegisterEvent extends LoginEvent{}

class SignInEvent extends LoginEvent{}

class LogInEvent extends LoginEvent{}

class HomeEvent extends LoginEvent{}

