import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));

void navigateToAndReplace(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
      (route) => false,
    );

Widget textFormField({
  required TextEditingController controller,
  required Function validate,
  required String labelText,
  required IconData prefix,
  required TextInputType textInputType,
  double borderRadius = 10.0,
  bool autoFocus = false,
  bool isPassword = false,
  IconButton? suffix,
  IconData? suffixIcon,
  Function? onTap,
  Function? onChange,
  TextDirection? textDirection,
  int maxLen = 75,
}) {
  return TextFormField(
    keyboardType: textInputType,
    maxLength: maxLen,
    style: const TextStyle(color: Colors.white),
    controller: controller,
    autofocus: autoFocus,
    obscureText: isPassword,
    decoration: InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 3.0),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      labelText: labelText,
      hoverColor: HexColor('023E8A'),
      focusColor: HexColor('03045E'),
      filled: true,
      labelStyle: const TextStyle(color: Colors.white),
      prefixIcon: Icon(prefix, color: Colors.white),
      suffix: suffix,
    ),
    textDirection: textDirection,
    validator: (value) {
      return validate(value);
    },
    onTap: () {
      // ignore: void_checks
      onTap!();
    },
    onChanged: (String value) {
      onChange!(value);
    },
  );
}

Widget separator() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 2.0,
      color: HexColor('DEE2E6'),
    ),
  );
}

Widget circularProgressIndicator() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: HexColor('023E8A'),
    color: HexColor('0077B6'),
  ));
}

Widget decorationButton(
  context, {
  Widget? pageRoute,
  Color? color,
  required String text,
}) {
  return InkWell(
    onTap: () {
      navigateTo(context, pageRoute);
    },
    child: Center(
      child: Container(
        height: 40.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: buttonColor,
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              HexColor('0077B6'),
              HexColor('023E8A'),
            ],
          ),
        ),
        child: Text(text, style: Theme.of(context).textTheme.bodyText1),
      ),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snack(
  context, {
  required String content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: const Duration(milliseconds: 700),
    padding: const EdgeInsets.all(8),
    backgroundColor: HexColor('023E8A'),
  ));
}
