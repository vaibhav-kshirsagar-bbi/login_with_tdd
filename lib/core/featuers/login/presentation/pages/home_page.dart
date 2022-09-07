import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_tdd/core/featuers/login/presentation/bloc/login_bloc.dart';
import 'package:login_page_tdd/core/featuers/login/presentation/widgets/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          SizedBox(
            width: 90,
            child: CustomButton(
                text: "Log Out",
                onPress: (){
                  BlocProvider.of<LoginBloc>(context).loadLoginScreen();
                }
            ),
          ),



        ],
      ),

      body: Column(
        children:  [

          const SizedBox(height: 200,),

          const Center(child: Text(
            "Home Page",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
            ),
          )),


          // SizedBox(height: MediaQuery.of(context).size.height/1.7,),




        ],




      ),

    );
  }
}
