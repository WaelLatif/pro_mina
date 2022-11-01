import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/custom_Form_text_field.dart';
import '../components/custom_button.dart';

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
                          function: () {},
                          text: 'log out',
                          width: size.width / 2.9,
                          height: size.height / 22.0,
                          fontSize: 20.0,
                          image: 'assets/images/arrowOut.jpg',
                        ),
                        CustomButton(
                          function: () {},
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
                          crossAxisSpacing: 15.0,
                          crossAxisCount: 3,
                          children: List.generate(
                            50,
                            (index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20.0),
                                ),
                              ),
                              padding: EdgeInsetsDirectional.all(2.5),
                              child: Image.asset(
                                'assets/images/arrowOut.jpg',
                                fit: BoxFit.cover,
                              ),
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
}
