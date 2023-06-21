import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/auth/registration_screen.dart';
import '../../../core/provider/auth.provider.dart';
import '../../styles/colors.dart';
import '../../utils/snack.bar.dart';
import '../../widgets/button.widget.dart';

import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _code = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();

  @override
  void dispose() {
    _code.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
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
                height: 200,
              ),
              const Text(
                'OTP',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 5, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Mobile Number",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextFormField(
                          controller: _mobileNumber,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: black,
                              hintText: "Mobile Number",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 5, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "OTP",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextFormField(
                          controller: _code,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.onetwothree),
                              prefixIconColor: black,
                              hintText: "OTP",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 60,
              ),
              Consumer<AuthenticationProvider>(builder: (context, auth, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (auth.resMessage != '') {
                    showMessage(message: auth.resMessage, context: context);

                    ///Clear the response message to avoid duplicate
                    auth.clear();
                  }
                });
                return customButton(
                  text: 'Login',
                  tap: () {
                    if (_code.text.isEmpty || _mobileNumber.text.isEmpty) {
                      showMessage(
                          message: "All fields are required", context: context);
                    } else {
                      auth.otp(
                          context: context,
                          mobile_number: _mobileNumber.text.trim(),
                          code: _code.text.trim());
                    }
                  },
                  context: context,
                  status: auth.isLoading,
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ));
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Container(),
                            ));
                      },
                      child: const Text(
                        "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
