import 'package:pro_mina/Model/user_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

 class LoginLoadingState extends LoginStates {}

 class LoginSuccessState extends LoginStates {
 final UserModel? user;

  LoginSuccessState(this.user);
 }

 class LoginErrorState extends LoginStates {
 String error;
 LoginErrorState(this.error);
 }