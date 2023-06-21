import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

Widget customButton(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Save',
    bool? isValid = false,
    BuildContext? context}) {
  return Container(
    height: 40,
    width: 200,
    margin: const EdgeInsets.only(right: 30, left: 30),
    child: MaterialButton(
      onPressed: status == true ? null : tap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      // color: const Color(0xffff1616),
      child: Container(
        height: 55,
        // margin: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: status == false ? white : grey,
            borderRadius: BorderRadius.circular(25)),
        // width: MediaQuery.of(context!).size.width,
        child: Text(
          status == false ? text! : 'Please wait...',
          style: TextStyle(
              color: secondaryColor, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
