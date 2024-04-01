import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required function,
  required String text,
}) => 
  Container(
    width: width,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        radius,
      ),
      color: background,
    ),
  );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  void Function(String? value)? onSubmit,
  void Function(String? value)? onChanged,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? sufix,
  bool isPassword = false,
  void Function()? suffixPressed,
}) 
  => TextFormField(
    obscureText: isPassword,
    controller: controller,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    keyboardType: textInputType,
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      labelText: label,
      floatingLabelStyle: TextStyle(
        color: Colors.blue,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      border: OutlineInputBorder(),
      prefixIcon: Icon(
        prefix,
        color: Colors.blue,
      ),
      suffixIcon: sufix != null ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          sufix,
          color: Colors.blue,
        ),
      ) : null,
    ),
    validator: validate,
);
                  