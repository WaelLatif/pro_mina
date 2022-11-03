// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:pro_mina/screens/gellary_screen.dart';

import '../components/components.dart';
import '../components/custom_Form_text_field.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {

            navigateAndReplace(context, GalleryScreen());

          }
        },
        builder: (context, state) {
          final TextEditingController emailController = TextEditingController();
          final TextEditingController  passwordController = TextEditingController();
          return Scaffold(
            body: Form(
              key:formKey,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(fit:BoxFit.fill,
                      image: AssetImage('assets/images/login.jpg',))
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: size.height/2.7,),
                      Center(
                        child: GlassmorphicContainer(
                          width: size.width * 0.9,
                          height: size.height * 0.5,
                          borderRadius: 30,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 100,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF75035).withAlpha(1),
                                Color(0xFFffffff).withAlpha(5),
                              ],
                              stops: [
                                0.5,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xFF4579C5).withAlpha(100),
                                Color(0xFFFFFFF).withAlpha(55),
                                Color(0xFFF75035).withAlpha(10),
                              ],
                              stops: [
                                0.0,
                                0.0,
                                0
                              ]),
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
                                      controller: emailController,
                                      size: size,
                                      width: size.width / 1.5,
                                      hintText: '   User Name',
                                      onChanged: (data) {
                                        email = data;
                                      },
                                    ),

                                    SizedBox(
                                      height: 25,
                                    ),
                                    CustomFormTextField(
                                      controller: passwordController,
                                      size: size,
                                      width: size.width / 1.5,
                                      hintText: '   Password',
                                      obsecureTxt: false,
                                      onChanged: (data) {
                                        password = data;
                                      },
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
                                  child: ConditionalBuilder(
                                    condition: state is! LoginLoadingState,
                                    builder: (context) => MaterialButton(
                                      onPressed: () async {
                                        LoginCubit.get(context).  userLogin(
                                            email: email!,
                                            password:
                                            password!);
                                        // navigateAndReplace(context, GalleryScreen());
                                      },
                                      child: Text(
                                        'SUBMIT',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    fallback: (context) => Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ),
            ),
          );
        },
      ),
    );
  }
}
