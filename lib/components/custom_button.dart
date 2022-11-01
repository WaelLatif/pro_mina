// ignore_for_file: prefer_const_constructors

import 'dart:core';

import 'package:flutter/material.dart';

import 'constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.function,
    this.isUpperCase,
    this.text,
    this.fontSize,
    this.width=double.infinity,
    this.height=60.0,
    this.image,
  });

  double width;
  double height;
  Color background = Colors.blue;
  bool? isUpperCase = true;
  double radius = 3.0;
  Function? function;
  String? text;
  String? image;
  double? fontSize = 16.0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 30.0,
              child: Image.asset(
                image!,
                fit: BoxFit.fitHeight,
              ),
            ),
            MaterialButton(
              onPressed: () {
                function!();
              },
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
