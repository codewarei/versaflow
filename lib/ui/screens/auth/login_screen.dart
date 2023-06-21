import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/auth/registration_screen.dart';
import '../../../core/provider/auth.provider.dart';
import '../../styles/colors.dart';
import '../../styles/ui.helpers.dart';
import '../../utils/snack.bar.dart';
import '../../widgets/button.widget.dart';

import 'package:provider/provider.dart';

import '../../widgets/topimage.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool passenable = true;

  @override
  void dispose() {
    _username.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                  height: 140,
                  child:
                      TopImage(imagePath: 'assets/images/versaflow-lite.png')),
              Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: white,
                    fontFamily: 'Roboto',
                    letterSpacing: 25),
              ),
              const SizedBox(
                height: 25,
              ),
              // Container(
              //     // width: double.infinity,
              //     // height: 70,
              //     margin: const EdgeInsets.symmetric(horizontal: 25),
              //     decoration: BoxDecoration(
              //         color: white,
              //         borderRadius: BorderRadius.circular(25),
              //         boxShadow: [
              //           BoxShadow(
              //             color: grey.withOpacity(0.03),
              //             spreadRadius: 10,
              //             blurRadius: 3,
              //             // changes position of shadow
              //           ),
              //         ]),
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           left: 20, top: 18, bottom: 5, right: 20),
              //       child: TextFormField(
              //         controller: _username,
              //         cursorColor: black,
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w500,
              //             color: black),
              //         decoration: InputDecoration(
              //             prefixIcon: Icon(
              //               Icons.email_outlined,
              //               color: secondaryColor,
              //             ),
              //             prefixIconColor: black,
              //             hintText: "Username",
              //             border: InputBorder.none),
              //       ),
              //     )),
              Container(
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ]),
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _username,
                    style: TextStyle(
                      fontSize: 15,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: const Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),

                      // errorText: "Error",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.white,

                      hintText: "Username",

                      //make hint text
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),

                      //create lable
                      // labelText: 'Email/Mobile',
                      //lable style
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //     width: double.infinity,
              //     margin: const EdgeInsets.symmetric(horizontal: 25),
              //     decoration: BoxDecoration(
              //         color: white,
              //         borderRadius: BorderRadius.circular(25),
              //         boxShadow: [
              //           BoxShadow(
              //             color: grey.withOpacity(0.03),
              //             spreadRadius: 10,
              //             blurRadius: 3,
              //             // changes position of shadow
              //           ),
              //         ]),
              //     child: Padding(
              //       padding:
              //           const EdgeInsets.only(left: 20, bottom: 5, right: 20),
              //       child: TextFormField(
              //         obscureText: passenable,
              //         controller: _password,
              //         cursorColor: black,
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w500,
              //             color: black),
              //         decoration: InputDecoration(
              //             prefixIcon: Icon(
              //               Icons.lock_outline_rounded,
              //               color: secondaryColor,
              //             ),
              //             prefixIconColor: Colors.black,
              //             suffix: IconButton(
              //               onPressed: () {
              //                 //add Icon button at end of TextField
              //                 setState(() {
              //                   //refresh UI
              //                   if (passenable) {
              //                     //if passenable == true, make it false
              //                     passenable = false;
              //                   } else {
              //                     passenable =
              //                         true; //if passenable == false, make it true
              //                   }
              //                 });
              //               },
              //               icon: Icon(passenable == true
              //                   ? Icons.visibility
              //                   : Icons.visibility_off_outlined),
              //             ),
              //             //eye icon if passenable = true, else, Icon is ***__
              //             hintText: "Password",
              //             border: InputBorder.none),
              //       ),
              //     )),
              Container(
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ]),
                margin: const EdgeInsets.all(1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: passenable,
                    controller: _password,
                    style: TextStyle(
                      fontSize: 15,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          //add Icon button at end of TextField
                          setState(() {
                            //refresh UI
                            if (passenable) {
                              //if passenable == true, make it false
                              passenable = false;
                            } else {
                              passenable =
                                  true; //if passenable == false, make it true
                            }
                          });
                        },
                        icon: Icon(passenable == true
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                      ),

                      // errorText: "Error",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.white,

                      hintText: "Password",

                      //make hint text
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),

                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium(),
              Consumer<AuthenticationProvider>(builder: (context, auth, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (auth.resMessage != '') {
                    showMessage(message: auth.resMessage, context: context);

                    ///Clear the response message to avoid duplicate
                    auth.clear();
                  }
                });
                return customButton(
                  text: 'SUBMIT',
                  tap: () {
                    if (_username.text.isEmpty || _password.text.isEmpty) {
                      showMessage(
                          message: "All fields are required", context: context);
                    } else {
                      auth.loginUser(
                          context: context,
                          username: _username.text.trim(),
                          password: _password.text.trim());
                    }
                  },
                  context: context,
                  status: auth.isLoading,
                );
              }),
              UIHelper.verticalSpaceLarge(),
              Container(
                height: 40,
                width: 200,
                margin: const EdgeInsets.only(right: 30, left: 30),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  // color: const Color(0xffff1616),
                  child: Container(
                    height: 55,
                    // margin: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(25)),
                    // width: MediaQuery.of(context!).size.width,
                    child: Text(
                      'REGISTRATION',
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
