// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/constant.dart';
import '../components/custom_Form_text_field.dart';
import '../components/custom_button.dart';
import 'login_screen.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/images/gallery.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 10.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(.7),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Mina',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(.7),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                              child: Image.asset(
                                'assets/images/login.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          function: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                                    (route) => false);
                          },
                          text: 'log out',
                          width: size.width / 2.9,
                          height: size.height / 22.0,
                          fontSize: 20.0,
                          image: 'assets/images/arrowOut.jpg',
                        ),
                        CustomButton(
                          function: () {
                            PickImage(context, size);
                          },
                          text: 'upload',
                          width: size.width / 2.9,
                          height: size.height / 22.0,
                          fontSize: 20.0,
                          image: 'assets/images/arrowUp.jpg',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 5.0,
                          crossAxisCount: 3,
                          children: List.generate(
                            50,
                            (index) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 8.0),
                              child: buildGridProduct(context, size),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridProduct(context, size) => SizedBox(
        width: size.width / 2.4,
        height: size.height / 3.9,
        child: InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/images/login.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  void PickImage(context, size) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: ClipRRect(

              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  height: size.height/3.5,
                  width: size.width/3.5,
                  color:Colors.white.withOpacity(.1),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        function: () {
                          pickImage(ImageSource.gallery);
                        },
                        background: Color(0xffF0d8fa),
                        text: 'Gallary',
                        width: size.width / 2.2,
                        height: size.height / 16.0,
                        fontSize: 20.0,
                        image: 'assets/images/galleryLogo.jpg',
                      ),
                      SizedBox(height: 40,),
                      CustomButton(
                        function: () {
                          pickImage(ImageSource.camera);
                        },
                        background: Color(0xffecf6ff),
                        text: 'Camera',
                        width: size.width /2.2,
                        height: size.height / 16.0,
                        fontSize: 20.0,
                        image: 'assets/images/cameraLogo.jpg',
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  File? image;
  Future pickImage(ImageSource source) async{
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return ;

    final imageTemporary = File(image.path );
    this.image = imageTemporary;

  }
}
