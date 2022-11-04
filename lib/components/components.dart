import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_mina/components/variables.dart';


void navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}


void navigateAndReplace(BuildContext context, Widget widget) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));
}

Color messageColor(AppState state) {
  switch (state) {
    case AppState.success:
      return Colors.green;
    case AppState.warning:
      return Colors.yellowAccent;
    case AppState.error:
      return Colors.red;
  }
}

int messageDuration(DurationState duration) {
  switch (duration) {
    case DurationState.success:
      return 3;
    case DurationState.warning:
      return 4;
    case DurationState.error:
      return 5;
  }
}

void ShowToast(
    context, {
      required String message,
      AppState state = AppState.success,
      DurationState duration = DurationState.success,


    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: messageDuration(duration)),
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: messageColor(state),
    ),
  );
}