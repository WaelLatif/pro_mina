import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina/Model/user_model.dart';
import '../../components/constant.dart';
import '../../network/end_points.dart';
import '../../network/local/cache_helper.dart';
import '../../network/remote/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

static LoginCubit get(context)=>BlocProvider.of(context);

UserModel? model;
  void userLogin(
  {required String email, required String password}) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      model = UserModel.fromJson(value.data);
      print(model!.user!.name);

      CacheHelper.saveData(key: userName, value: model!.user!.name);

      emit(LoginSuccessState(model));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

}
