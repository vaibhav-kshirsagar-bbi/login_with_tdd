import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_tdd/core/featuers/login/presentation/bloc/login_bloc.dart';
import 'package:login_page_tdd/core/featuers/login/presentation/widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children:  [

          const SizedBox(height: 200,),

          const Center(child: Text(
              "Welcome",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
          )),


          SizedBox(height: MediaQuery.of(context).size.height/1.7,),


          CustomButton(
              text: "Get Stated",
              onPress: (){
                BlocProvider.of<LoginBloc>(context).loadRegisterScreen();
              }
          ),


        ],




      ),

    );
  }
}
