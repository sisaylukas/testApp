import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/ui/views/signin/signIn_viewmodel.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, child, model) => const Scaffold(
              body: Center(
                child: Text("SignIn View"),
              ),
            ));
  }
}
