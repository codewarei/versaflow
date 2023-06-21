import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/auth.provider.dart';
import '../../styles/colors.dart';
import '../../styles/ui.helpers.dart';
import '../../utils/snack.bar.dart';
import '../../widgets/button.widget.dart';
import '../../widgets/topimage.widget.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _company = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _newsletter = TextEditingController(text: '1');

  @override
  void dispose() {
    _company.clear();
    _contact.clear();
    _email.clear();
    _mobile.clear();
    _newsletter.clear();
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
        child: Column(
          children: [
            const SizedBox(
                height: 140,
                child: TopImage(imagePath: 'assets/images/versaflow-lite.png')),
            Text(
              'REGISTRATION',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: white,
                  fontFamily: 'Roboto',
                  letterSpacing: 15),
            ),
            UIHelper.verticalSpaceLarge(),
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
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _company,
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
                      Icons.business_center,
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

                    hintText: "Company",

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
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _contact,
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
                      Icons.account_tree,
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

                    hintText: "Contact",

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
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
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
                      Icons.email_outlined,
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

                    hintText: "Email",

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
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _mobile,
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
                      Icons.phone,
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

                    hintText: "Mobile",

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
                  if (_mobile.text.isEmpty ||
                      _email.text.isEmpty ||
                      _contact.text.isEmpty ||
                      _company.text.isEmpty ||
                      _newsletter.text.isEmpty) {
                    showMessage(
                        message: "All fields are required", context: context);
                  } else {
                    auth.registerUser(
                        context: context,
                        company: _company.text.trim(),
                        contact: _contact.text.trim(),
                        mobile: _mobile.text.trim(),
                        email: _email.text.trim(),
                        newsletter: _newsletter.text.trim());
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
                        builder: (context) => const LoginScreen(),
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
                    'LOGIN',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
