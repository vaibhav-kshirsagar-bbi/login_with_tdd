import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_tdd/featuers/login/domain/entity/user_details.dart';
import 'package:login_page_tdd/featuers/login/presentation/bloc/login_bloc.dart';

import '../widgets/buttons.dart';
import 'package:validators/validators.dart';

// import 'HomeScreen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool isEmailCorrect = false;
  bool isPasswordEightCharecter = false;
  bool hasPasswordOneNumber = false;
  bool isVisible = false;

  // bool isValidForm() {
  //   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  //     return isEmailCorrect && isPasswordEightCharecter && hasPasswordOneNumber;
  //   }

  //   return false;
  // }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      isPasswordEightCharecter = false;
      if (password.length >= 8) isPasswordEightCharecter = true;

      hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) hasPasswordOneNumber = true;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var buttonBGcolor = isValidForm() ? Colors.green : Colors.blue;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        // backgroundColor: Colors.blue,
        body: Container(
          // decoration: BoxDecoration(
          //     gradient:
          //         LinearGradient(colors: [Colors.blue, Colors.blue.shade100])),asdz
          color: const Color(0xff3B3B3B),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Registartion",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Row(
                            children: const [
                              Text(
                                " Name * ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: nameController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            showCursor: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "name",
                                hintStyle:
                                    const TextStyle(color: Colors.grey, fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade200,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Row(
                            children: const [
                              Text(
                                " Age * ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: ageController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            showCursor: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Age",
                                hintText: "18",
                                hintStyle:
                                    const TextStyle(color: Colors.grey, fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade200,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Row(
                            children: const [
                              Text(
                                " Email address * ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: emailController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            showCursor: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "enter your mail",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade200,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Row(
                            children: const [
                              Text(
                                " Password * ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: !isVisible,
                            onChanged: (password) =>
                                onPasswordChanged(password),
                            showCursor: true,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: isVisible
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : const Icon(Icons.visibility_off,
                                          color: Colors.grey),
                                ),
                                labelText: "Password",
                                //hintText: "",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade200,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),

                        CustomButton(
                          text: "Register",
                          onPress: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty &&
                                nameController.text.isNotEmpty &&
                                ageController.text.isNotEmpty &&
                                isEmailCorrect &&
                                isPasswordEightCharecter &&
                                hasPasswordOneNumber) {
                              BlocProvider.of<LoginBloc>(context)
                                  .saveUserDetails(UserDetails(name: nameController.text, age: int.parse(ageController.text), userId: emailController.text, password: passwordController.text));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Please enter Missing data'),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
