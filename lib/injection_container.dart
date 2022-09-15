
import 'package:get_it/get_it.dart';
import 'package:login_page_tdd/featuers/login/data/datasource/login_datasource.dart';
import 'package:login_page_tdd/featuers/login/data/repositories/login_repositoris_impl.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/get_screen_number.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/get_user_details.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/is_remember_me.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/login.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/set_is_remember_me.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/set_screen_number.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/set_user_details.dart';
import 'package:login_page_tdd/featuers/login/presentation/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'featuers/login/domain/repositories/login_repositories.dart';

final sl = GetIt.instance;

Future<void> init()
async {

  //feature

    sl.registerFactory(() => LoginBloc(getScreenNumber: sl(), getUserDetails: sl(), isRememberMe: sl(), login: sl(), setIsRememberMe: sl(), setScreenNumber: sl(), setUserDetails: sl()));
    
    
  // use case
    
    sl.registerLazySingleton(() => GetScreenNumber(sl()));
    sl.registerLazySingleton(() => GetUserDetails(sl()));
    sl.registerLazySingleton(() => IsRememberMe(sl()));
    sl.registerLazySingleton(() => Login(sl()));
    sl.registerLazySingleton(() => SetIsRememberMe(sl()));
    sl.registerLazySingleton(() => SetScreenNumber(sl()));
    sl.registerLazySingleton(() => SetUserDetails(sl()));




  // repository

    sl.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(loginDataSource: sl()));


  // datasource

    sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(sharedPreferences: sl()));

  // core


  //external

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);



}