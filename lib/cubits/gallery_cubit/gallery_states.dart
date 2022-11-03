import 'package:pro_mina/Model/gallery_model.dart';
import 'package:pro_mina/Model/user_model.dart';

abstract class GalleryStates {}

class getImagesInitialState extends GalleryStates {}

 class getImagesLoadingState extends GalleryStates {}

 class getImagesSuccessState extends GalleryStates {}

 class getImagesErrorState extends GalleryStates {
 String error;
 getImagesErrorState(this.error);
 }