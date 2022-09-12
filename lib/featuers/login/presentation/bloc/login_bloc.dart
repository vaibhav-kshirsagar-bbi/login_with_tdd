

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {

    });

    on<RegisterEvent>((event, emit) {

      emit(RegisterState());
    });

    on<SignInEvent>((event, emit) {

      emit(SignInState());
    });


    on<LogInEvent>((event, emit) {

      emit(LogInState());
    });

    on<HomeEvent>((event, emit) {

      emit(HomeState());
    });

  }


  loadRegisterScreen(){
    add(RegisterEvent());
  }

  loadSingInPage() {
    add(SignInEvent());
  }

  void loadLoginScreen() {

    add(LogInEvent());

  }

  void loadHomeScreen() {
    add(HomeEvent());
  }



}
