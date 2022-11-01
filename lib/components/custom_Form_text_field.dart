// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constant.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    this.hintText,
    this.onChanged,
    this.id,
    this.obsecureTxt = false,
    this.size,
    this.width,
  });

  String? hintText;
  Function(String)? onChanged;
  String? id;
  bool? obsecureTxt;
  Size? size;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        margin: EdgeInsets.only(
          bottom: size!.width * .05,
        ),
        height: size!.width / 8.5,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          obscureText: obsecureTxt!,
          validator: (data) {
            if (data!.isEmpty) {
              return 'field is required !';
            }
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
