import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina/components/constant.dart';
import 'package:pro_mina/network/remote/dio_helper.dart';
import 'package:pro_mina/screens/gellary_screen.dart';
import 'package:pro_mina/screens/login_screen.dart';
import 'components/bloc_observer.dart';
import 'cubits/gallery_cubit/gallery_cubit.dart';
import 'cubits/gallery_cubit/gallery_states.dart';
import 'network/local/cache_helper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget? widget;
  if (CacheHelper.sharedPreferences.containsKey(userName)) {
    widget = GalleryScreen();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    widget: widget,
  ));
}
class MyApp extends StatelessWidget {
  MyApp({
    this.widget,
  });
  Widget? widget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => GalleryCubit()..getImages(),
        child:  BlocConsumer<GalleryCubit, GalleryStates>(
    listener: (context, state) {},
    builder: (context, state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget,
    );
    },
        ),
    );
  }
}