// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/custom_Form_text_field.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body:
      ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
        SingleChildScrollView(
          child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                child: Image.asset(
                  'assets/images/login.jpg',
                                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  children: [

                      SizedBox(height:290.0),

                    Expanded(
                      flex:4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                          child: SizedBox(
                            width: size.width * .9,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.width * .10,
                                    bottom: size.width * .1,
                                  ),
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black.withOpacity(.7),
                                    ),
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomFormTextField(
                                      size: size,
                                      width: size.width / 1.5,
                                      hintText: '   User Name',
                                    ),
                                    SizedBox(height: 25,),
                                    CustomFormTextField(
                                      size: size,
                                      width: size.width / 1.5,
                                      hintText: '   Password',
                                      obsecureTxt: true,

                                    ),


                                  ],
                                ),

                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: size.width * .05,
                                  ),
                                  height: size.width / 8.5,
                                  width: size.width / 1.30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: MaterialButton(
                                    onPressed: (){

                                    },
                                    child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(height: 20,),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
        ),


        ],
      ),

    );

  }




}
