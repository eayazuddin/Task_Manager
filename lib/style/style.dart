
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed=Color.fromRGBO(231, 28, 36, 1);
const colorGreen=Color.fromRGBO(33, 191, 115, 1);
const colorWhite=Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue=Color.fromRGBO(44, 62, 80, 1);
const colorDark=Color.fromRGBO(136, 28, 32, 1);
const colorOrange=Color.fromRGBO(230, 126, 34, 1);
const colorLightGray=Color.fromRGBO(135, 142, 150, 1);
const colorLight=Color.fromRGBO(211, 211, 211, 1);
const colorBlue=Color.fromRGBO(0, 0, 255, 1);

SizedBox ItemSizedBox(child){
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.all(10),
      child: child,
    ),
  );
}

PinTheme AppOtpStyle(){
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: colorWhite
  );
}
ButtonStyle AppStatusButtonStyle(btnColor){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
  );
}

TextStyle Head3Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: "poppins",
      fontWeight: FontWeight.w700
  );
}

TextStyle Head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: "poppins",
    fontWeight: FontWeight.w700
  );
}
TextStyle Head7Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 12,
      fontFamily: "poppins",
      fontWeight: FontWeight.w400
  );
}

Container StatusChild(statusText,statusColor){
  return  Container(
    alignment: Alignment.center,
    child:Text(statusText,style: TextStyle(color: colorWhite,fontSize: 10,fontWeight: FontWeight.w400)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: statusColor,
    ),
    height: 20,
    width: 60,
  );
}


TextStyle Head6Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: "poppins",
      fontWeight: FontWeight.w400
  );
}
InputDecoration AppInputDecoration(label){
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorGreen,
        ),
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorGreen,
        ),
      ),
      border: OutlineInputBorder(),
      labelText: label
  );
}

SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/screen-back.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}
DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
    decoration: BoxDecoration(
        color: colorWhite,border: Border.all(color: colorWhite,width: 1),
        borderRadius: BorderRadius.circular(4)
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: child,
    ),
  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.all(12),
      backgroundColor: colorGreen,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      )
  );
}
Ink SuccessButtonChild(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      alignment: Alignment.center,
      child: Text(ButtonText,style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16
      ),),
    ),
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}
void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}
// SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
//   return SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 2,
//       mainAxisExtent: 250
//   );
// }