part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class WelcomeEvent extends LoginEvent{}

class RegisterEvent extends LoginEvent{}

class SignInEvent extends LoginEvent{}

class LogInEvent extends LoginEvent{}

class HomeEvent extends LoginEvent{}

