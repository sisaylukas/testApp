import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/ui/views/home/home_view.dart';
import 'package:testapp/ui/views/intro/intro_view.dart';

import 'package:testapp/ui/views/signup/signup_view.dart';
import 'package:testapp/ui/views/startup/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => StartUpViewModel(context),
        builder: (context, model, child) => const HomeView()
        // model.show ? const IntroductionView() : SignUpView(),
        );
  }
}
