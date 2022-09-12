import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_tdd/featuers/login/presentation/bloc/login_bloc.dart';
import 'package:login_page_tdd/featuers/login/presentation/widgets/buttons.dart';

class RegisterDoneScreen extends StatefulWidget {
  const RegisterDoneScreen({Key? key}) : super(key: key);

  @override
  State<RegisterDoneScreen> createState() => _RegisterDoneScreenState();
}

class _RegisterDoneScreenState extends State<RegisterDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children:  [

          const SizedBox(height: 200,),

          const Center(child: Text(
            "Account created ",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
            ),
          )),


          SizedBox(height: MediaQuery.of(context).size.height/1.7,),


          CustomButton(
              text: "Sign In",
              onPress: (){
                BlocProvider.of<LoginBloc>(context).loadLoginScreen();
              }
          ),
        ],
      ),
    );
  }
}
