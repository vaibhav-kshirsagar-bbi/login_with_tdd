

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:login_page_tdd/core/errors/failure.dart';
import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/get_screen_number.dart';
import '../../domain/usecase/get_user_details.dart';
import '../../domain/usecase/is_remember_me.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/set_is_remember_me.dart';
import '../../domain/usecase/set_screen_number.dart';
import '../../domain/usecase/set_user_details.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  GetScreenNumber getScreenNumber;
  GetUserDetails getUserDetails;
  IsRememberMe isRememberMe;
  Login login;
  SetIsRememberMe setIsRememberMe;
  SetScreenNumber setScreenNumber;
  SetUserDetails setUserDetails;



  LoginBloc( {required this.getScreenNumber, required this.getUserDetails,required this.isRememberMe,required this.login,required this.setIsRememberMe,required this.setScreenNumber,required this.setUserDetails} ) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {

    });

    on<WelcomeEvent>((event, emit) {


      emit(WelcomeState());

    });

    on<RegisterEvent>((event, emit) {

      saveScreenNumber("page2");
      emit(RegisterState());
    });

    on<SignInEvent>((event, emit) {

      saveScreenNumber("page3");
      emit(SignInState());
    });


    on<LogInEvent>((event, emit) {

      saveScreenNumber("page4");
      emit(LogInState());
    });

    on<HomeEvent>((event, emit) {
      saveScreenNumber("page3");
      emit(HomeState());
    });

  }


  loadWelcomeScreen(){

    add(WelcomeEvent());
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

//---------------------------------------------------------------------

  void saveScreenNumber(String screenNumber){

    setScreenNumber(screenNumber: screenNumber);

  }

  void getSavedScreenNumber() async {

    Either<Failure, String> either;

    either = await getScreenNumber();

    bool checkbox= await getIsRememberMe();

    either.fold(
          (failure) => add(WelcomeEvent()),
          (page) {

            print(" page is $page  and checkbox is $checkbox");

            if(page == 'page1'){
              add(WelcomeEvent());
            }else if(page == 'page2'){
              add(RegisterEvent());
            }else if(page == 'page3' && checkbox==false){
              add(SignInEvent());
            }else if(page == 'page4'){
              add(LogInEvent());
            }else if(checkbox== true){
              add(HomeEvent());
            }

          },
    );
  }

  void saveUserDetails(UserDetails userDetails){

    setUserDetails(userDetails: userDetails);

    add(SignInEvent());
  }

  Future<UserDetails?> getSavedUserDetails()  async {

    Either<Failure, UserDetails> either;
    UserDetails? userDetails;
    either = await getUserDetails();

    either.fold(
            (l) => add(RegisterEvent()),
            (r) {
              userDetails=r;
            }
    );

    return  userDetails;
  }

  void saveIsRememberMe(bool value){

    setIsRememberMe(value: value);

  }

  Future<bool> getIsRememberMe() async {

    Either<Failure, bool> either;
    bool? b;

    either = await isRememberMe();

    either.fold(
            (l) => add(WelcomeEvent()),
            (r) {
              b=r;
            });

    if(b!=null) {
      return b!;
    } else {
      return false;
    }

  }

  void checkLogin(String email,String password)async{

    Either<Failure, bool> either;


    either = await login(userId: email,password: password);

    either.fold(
            (l) => add(SignInEvent()),
            (r) {
              if(r==true) {
                add(HomeEvent());
              } else {
                add(SignInEvent());
              }
            }
    );

  }



}
