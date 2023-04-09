import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/services/sharedpreference_services.dart';
import 'package:testapp/ui/views/home/home_view.dart';
import 'package:testapp/ui/views/intro/intro_view.dart';
import 'package:testapp/ui/views/signin/signIn_viewmodel.dart';
import 'package:testapp/ui/views/signup/signup_view.dart';
import 'package:testapp/ui/views/startup/startup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView),
  MaterialRoute(page: IntroductionView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: SignInViewModel)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SharedPreferenceServices)
], logger: StackedLogger())
class AppSetUp {}
