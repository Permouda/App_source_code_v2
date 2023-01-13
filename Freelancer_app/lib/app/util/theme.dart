/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:flutter/material.dart';

const typeTheme = Typography.whiteMountainView;

class ThemeProvider {
  static const appColor = Color(0xFF1CAE81);
  static const secondaryAppColor = Color(0xFFFF8A44);

  static const neutralAppColor1 = Color(0xFFFBA709);
  static const neutralAppColor2 = Color(0xFFFF8A44);
  static const neutralAppColor3 = Color(0xFF1DBF73);
  static const neutralAppColor4 = Color(0xFFfe2121);

  static const appColorTint = Color(0xFFd2efe6);
  static const secondaryAppColorTint = Color(0xFFffe8da);

  static const whiteColor = Colors.white;
  static const transparentColor = Colors.transparent;

  static const blackColor = Color(0xFF000000);
  static const greyColor = Colors.grey;
  static const lightBlackColor = Colors.black12;
  static const starColor = Colors.yellow;

  static const backgroundColor = Color.fromARGB(255, 243, 243, 243);

  static const transParent = Colors.transparent;

  static const titleStyle = TextStyle(
      fontSize: 14, fontFamily: 'bold', color: ThemeProvider.whiteColor);
}

TextTheme txtTheme = Typography.whiteMountainView.copyWith(
  bodyText1: typeTheme.bodyText1?.copyWith(fontSize: 16),
  bodyText2: typeTheme.bodyText2?.copyWith(fontSize: 14),
  headline1: typeTheme.headline1?.copyWith(fontSize: 32),
  headline2: typeTheme.headline2?.copyWith(fontSize: 28),
  headline3: typeTheme.headline3?.copyWith(fontSize: 24),
  headline4: typeTheme.headline4?.copyWith(fontSize: 21),
  headline5: typeTheme.headline5?.copyWith(fontSize: 18),
  headline6: typeTheme.headline6?.copyWith(fontSize: 16),
  subtitle1: typeTheme.subtitle1?.copyWith(fontSize: 24),
  subtitle2: typeTheme.subtitle2?.copyWith(fontSize: 21),
);

ThemeData light = ThemeData(
    fontFamily: 'regular',
    primaryColor: ThemeProvider.appColor,
    secondaryHeaderColor: ThemeProvider.secondaryAppColor,
    disabledColor: const Color(0xFFBABFC4),
    backgroundColor: const Color(0xFFF3F3F3),
    errorColor: const Color(0xFFE84D4F),
    brightness: Brightness.light,
    hintColor: const Color(0xFF9F9F9F),
    cardColor: ThemeProvider.appColor,
    colorScheme: const ColorScheme.light(
        primary: ThemeProvider.appColor,
        secondary: ThemeProvider.secondaryAppColor),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ThemeProvider.appColor)),
    textTheme: txtTheme);

ThemeData dark = ThemeData(
    fontFamily: 'regular',
    primaryColor: ThemeProvider.blackColor,
    secondaryHeaderColor: const Color(0xFF009f67),
    disabledColor: const Color(0xffa2a7ad),
    backgroundColor: const Color(0xFF343636),
    errorColor: const Color(0xFFdd3135),
    brightness: Brightness.dark,
    hintColor: const Color(0xFFbebebe),
    cardColor: ThemeProvider.blackColor,
    colorScheme: const ColorScheme.dark(
        primary: ThemeProvider.blackColor, secondary: Color(0xFFffbd5c)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ThemeProvider.blackColor)),
    textTheme: txtTheme);

myTextField(hint) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      height: 45,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      decoration: BoxDecoration(
        color: ThemeProvider.backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ThemeProvider.blackColor.withOpacity(0.2),
              offset: const Offset(0, 1),
              blurRadius: 3),
        ],
      ),
      child: TextField(
        onChanged: (String txt) {},
        style: const TextStyle(fontSize: 16, fontFamily: 'medium'),
        cursorColor: ThemeProvider.appColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle:
              const TextStyle(color: ThemeProvider.greyColor, fontSize: 14),
        ),
      ),
    ),
  );
}

heading1(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 22, fontFamily: 'bold', color: ThemeProvider.blackColor),
  );
}

heading2(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 18, fontFamily: 'medium', color: ThemeProvider.blackColor),
  );
}

heading3(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 16, fontFamily: 'medium', color: ThemeProvider.blackColor),
  );
}

heading4(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 14, fontFamily: 'medium', color: ThemeProvider.blackColor),
  );
}

subtitle1(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 16, color: ThemeProvider.blackColor),
  );
}

bodyText1(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 14, color: ThemeProvider.blackColor),
  );
}

lightText(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 14, fontFamily: 'medium', color: ThemeProvider.greyColor),
  );
}

smallBoldText(val) {
  return Text(
    val,
    style: const TextStyle(
        fontFamily: 'medium', fontSize: 12, color: ThemeProvider.blackColor),
  );
}

smallText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 11, color: ThemeProvider.greyColor),
  );
}

colorText(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 22, fontFamily: 'bold', color: ThemeProvider.appColor),
  );
}

myBoxDecoration() {
  return BoxDecoration(
    color: ThemeProvider.whiteColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
    boxShadow: [
      BoxShadow(
          color: ThemeProvider.blackColor.withOpacity(0.2),
          offset: const Offset(0, 1),
          blurRadius: 3),
    ],
  );
}

textFieldDecoration() {
  return BoxDecoration(
    color: ThemeProvider.backgroundColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(8.0),
    ),
    boxShadow: [
      BoxShadow(
          color: ThemeProvider.blackColor.withOpacity(0.2),
          offset: const Offset(0, 1),
          blurRadius: 3),
    ],
  );
}
