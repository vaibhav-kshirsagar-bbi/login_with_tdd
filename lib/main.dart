import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_tdd/featuers/login/domain/repositories/login_repositories.dart';
import 'package:login_page_tdd/featuers/login/domain/usecase/get_screen_number.dart';
import 'package:login_page_tdd/featuers/login/presentation/pages/home_page.dart';
import 'package:login_page_tdd/featuers/login/presentation/pages/login_page.dart';
import 'package:login_page_tdd/featuers/login/presentation/pages/register_screen.dart';
import 'package:login_page_tdd/featuers/login/presentation/pages/welcome_screen.dart';

import 'featuers/login/presentation/bloc/login_bloc.dart';
import 'featuers/login/presentation/pages/register_done_screen.dart';

import 'package:login_page_tdd/injection_container.dart' as di;

import 'injection_container.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>  sl<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {

            print("in bloc builde");

            if(state is WelcomeState){

              return const WelcomeScreen();

            }else if(state is RegisterState){

              return const RegisterPage();

            }else if (state is SignInState){

             return  RegisterDoneScreen();

            }else if(state is LogInState){

              return LoginScreen();

            }else if(state is HomeState){

                return HomePage();

            }

            BlocProvider.of<LoginBloc>(context).getSavedScreenNumber();
            return const WelcomeScreen();

          },
        ),
      ),
    );
  }
}




