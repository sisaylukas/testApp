import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends FutureViewModel {
  bool _checkBoxStatus = false;
  bool get checkBoxStatus => _checkBoxStatus;
  @override
  Future futureToRun() {
    // TODO: implement futureToRun
    throw UnimplementedError();
  }

  //CheckBox listner
  void checkBoxChange() async {
    _checkBoxStatus = true;
  }
}
