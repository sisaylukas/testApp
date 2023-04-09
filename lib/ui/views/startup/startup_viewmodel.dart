import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/app.locator.dart';
import 'package:testapp/services/sharedpreference_services.dart';

class StartUpViewModel extends FutureViewModel {
  // final _navigationService = locator<NavigationService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPreferenceServices = locator<SharedPreferenceServices>();
  bool _show = true;
  bool get show => _show;
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlert = false;
  BuildContext context;
  StartUpViewModel(this.context);
  @override
  Future futureToRun() async {
    await getConnectivity();
    await _sharedPreferenceServices.sharedPreferenceInstance();
    await chekOnboarding();
  }

  Future<void> getConnectivity() async {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlert == false) {
        showDialogBox();
      }
    });
  }

  Future<void> chekOnboarding() async {
    _show = await _sharedPreferenceServices.getOnBoarding("ONBoarding") ?? true;
  }

  void showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text("No connection"),
          content: const Text("please check your internet conncectivity"),
          actions: [
            TextButton(
              onPressed: () async {
                _navigationService.back();
                isAlert = false;
                notifyListeners();
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  isAlert = true;
                  notifyListeners();
                }
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
}
