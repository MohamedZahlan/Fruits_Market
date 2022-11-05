import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton({
  required String text,
  required Color color,
  Function? function,
}) =>
    Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: HexColor('#53B175'), borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required String label,
  required IconData prefix,
  Widget? suffix,
  required TextEditingController controller,
  required validate,
  Function? onTap,
  bool obscureText = false,
  required TextInputType type,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: validate,
      obscureText: obscureText,
      keyboardType: type,
      onTap: () {
        onTap!();
      },
      textInputAction: TextInputAction.next,
      controller: controller,
      onChanged: (text) {},
    );

// Dismissible => to swipe

Widget myDivider({
  required double horizontal,
  required double vertical,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[200],
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

Widget defaultTextButton({required Function function, required String text}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );

void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        fontSize: 16,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
