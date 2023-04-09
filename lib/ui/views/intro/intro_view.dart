import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/ui/views/intro/intro_viewmodel.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroductionViewModel>.reactive(
        viewModelBuilder: () => IntroductionViewModel(),
        builder: (contex, model, child) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: IntroductionScreen(
                  pages: model.pages,
                  dotsDecorator: const DotsDecorator(
                      size: Size(15, 15),
                      activeSize: Size.square(20),
                      activeColor: Colors.yellow,
                      color: Colors.cyan),
                  showDoneButton: true,
                  done: const Text(
                    'Done',
                    style: TextStyle(fontSize: 20),
                  ),
                  showSkipButton: true,
                  skip: const Text('Skip', style: TextStyle(fontSize: 17)),
                  showNextButton: true,
                  next: const Text(
                    "Next",
                    style: TextStyle(fontSize: 17),
                  ),
                  onDone: model.onTaskDone,
                  curve: Curves.bounceInOut,
                ),
              ),
            ));
  }
}
