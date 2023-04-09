import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/app.locator.dart';
import 'package:testapp/app/app.logger.dart';
import 'package:testapp/app/app.router.dart';
import 'package:testapp/services/sharedpreference_services.dart';

class IntroductionViewModel extends FutureViewModel {
  final log = getLogger("IntroductionViewMdel");
  final _sharedPreferenceServices = locator<SharedPreferenceServices>();
  final _navigationServices = locator<NavigationService>();
  final List<PageViewModel> _pages = [
    PageViewModel(
      title: "FirstPage",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      // footer: ElevatedButton(
      //   onPressed: () {},
      //   child: const Text("Let's Go"),
      // ),
      image: Center(child: Image.asset("assets/pic1.png")),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20),
      ),
    ),
    PageViewModel(
      title: "SecondPage",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      // footer: ElevatedButton(
      //   onPressed: () {},
      //   child: const Text("Let's Go"),
      // ),
      image: Image.asset("assets/pic2.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20),
      ),
    ),
    PageViewModel(
      title: "ThirdPage",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      // footer: ElevatedButton(
      //   onPressed: () {},
      //   child: const Text("Let's Go"),
      // ),
      image: Image.asset("assets/p4.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20),
      ),
    ),
  ];
  List<PageViewModel> get pages => _pages;

  void onTaskDone() {
    _sharedPreferenceServices.setOnBoarding("ONBoarding", false);
    _navigationServices.back();
    _navigationServices.navigateTo(Routes.startUpView);

    notifyListeners();
  }

  @override
  Future futureToRun() async {
    await _sharedPreferenceServices.sharedPreferenceInstance();
  }
}
