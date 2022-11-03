import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina/Model/gallery_model.dart';
import 'package:pro_mina/Model/user_model.dart';
import '../../components/constant.dart';
import '../../network/end_points.dart';
import '../../network/local/cache_helper.dart';
import '../../network/remote/dio_helper.dart';
import 'gallery_states.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  GalleryCubit() : super(getImagesInitialState());

static GalleryCubit get(context)=>BlocProvider.of(context);

GalleryModel? gallery;

  void getImages() async {
    emit(getImagesLoadingState());
    await DioHelper.getData(
      url: myGallery
    ).then((value) {
      gallery = GalleryModel.fromJson(value!.data);
      print(gallery!.data!.images![0]);
      emit(getImagesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(getImagesErrorState(error.toString()));
    });
  }

}
