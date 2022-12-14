// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_mina/components/constant.dart';
import '../components/components.dart';
import '../components/custom_button.dart';
import '../components/variables.dart';
import '../cubits/gallery_cubit/gallery_cubit.dart';
import '../cubits/gallery_cubit/gallery_states.dart';
import '../network/local/cache_helper.dart';
import 'login_screen.dart';
import 'package:http/http.dart'as http;
import 'package:http_parser/http_parser.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    String fullName = CacheHelper.getData(key: userName);
    var names = fullName.split(' ');
    String firstName = names[0];

    return BlocConsumer<GalleryCubit, GalleryStates>(
      listener: (context, state) {
        if (state is addImagesErrorState) {
          ShowToast(
            context,
            message: 'Some Thing went Wrong ' ,
            state: AppState.error,
            duration: DurationState.error,
          );
        }
        if (state is addImagesSuccessState) {
          ShowToast(
            context,
            message: 'Image Add Successfully',
            state: AppState.success,
            duration: DurationState.success,);

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child:Container(
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(fit:BoxFit.fill,
                      image: AssetImage('assets/images/gallery.jpg',),),),
              child: Column(
                children: [
                  SizedBox(height: size.height*.025,),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.5,),
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
                              firstName,
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
                            radius: size.width*0.07,
                            child: Image.asset(
                              'assets/images/faceImage.jpg',
                              fit: BoxFit.fill,
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
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                                  (route) => false);
                          CacheHelper.removeData(key: userName);
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
                  ConditionalBuilder(
                    condition: GalleryCubit
                        .get(context)
                        .gallery != null,
                    fallback: (context) =>
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                    builder: (context) {
                      List<String>? images =
                          GalleryCubit
                              .get(context)
                              .gallery!
                              .data!
                              .images;
                      return Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 5.0,
                            crossAxisCount: 3,
                            children: List.generate(
                              images!.length,
                                  (index) =>
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, top: 8.0),
                                    child: buildGridImages(
                                        context, size, images[index]),
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),



        ),
        );},
    );
  }

  Widget buildGridImages(context, Size size, String image) =>
      SizedBox(
        width: size.width / 2.4,
        height: size.height / 3.9,
        child: InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: Image.network(
                image.toLowerCase().endsWith('.jpg') ||
                    image.toLowerCase().endsWith('.jpeg') ||
                    image.toLowerCase().endsWith('.png') ||
                    image.toLowerCase().endsWith('.webp')
                    ? image
                    : 'https://demofree.sirv.com/nope-not-here.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      );

  void PickImage(BuildContext context, size) {
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
                  height: size.height / 3.5,
                  width: size.width / 3.5,
                  color: Colors.white.withOpacity(.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        function: () {
                          pickImage(ImageSource.gallery, context).then((value) {
                            uploadImage(context);
                          });
                        },
                        background: Color(0xffF0d8fa),
                        text: 'Gallary',
                        width: size.width / 2.2,
                        height: size.height / 16.0,
                        fontSize: 20.0,
                        image: 'assets/images/galleryLogo.jpg',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        function: () {
                          pickImage(ImageSource.camera, context).then((value) {
                            uploadImage(context);
                          });
                        },
                        background: Color(0xffecf6ff),
                        text: 'Camera',
                        width: size.width / 2.2,
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
  var selectedImage;

  Future pickImage(ImageSource source, context) async {
    selectedImage = await ImagePicker().pickImage(source: source);
    if (selectedImage != null) {
      image = File(selectedImage.path) ;
    }
  }


 void uploadImage(context) async {

   String imageName = selectedImage.path.split('/').last;
   FormData formData =  FormData.fromMap({
     "img":  await MultipartFile.fromFile(selectedImage.path,
         filename: imageName, contentType: MediaType('image', 'png')),
   });

      GalleryCubit.get(context).addImage(formData);
    }

}