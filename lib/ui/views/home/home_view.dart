import 'package:expandable_fab_menu/expandable_fab_menu.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/shared/app_color.dart';
import 'package:testapp/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, child, model) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 110),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      AppColors.kThirdColor,
                      AppColors.kThirdColor,
                      //AppColors.kSecondaryColor
                    ], begin: Alignment.topCenter),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 153,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Wallet Balance",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "38,704.25 ",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FabCircularMenu(
          // ringWidth: 150,

          fabSize: 60,

          fabColor: AppColors.kPrimaryColor,
          ringWidth: 80,

          fabElevation: 10,
          fabOpenColor: AppColors.kPrimaryColor,
          fabCloseColor: AppColors.kPrimaryColor,
          ringColor: Colors.transparent,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.send_to_mobile,
                  size: 40,
                  color: AppColors.kPrimaryColor,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.account_balance,
                  size: 40,
                  color: AppColors.kPrimaryColor,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  size: 40,
                  color: AppColors.kPrimaryColor,
                ),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle_sharp,
                size: 40,
                color: AppColors.kPrimaryColor,
              ),
              onPressed: () {},
            ),
          ],
          animationDuration: Duration(milliseconds: 500),

          ringDiameter: 370.0,
          alignment: Alignment.bottomCenter,
          fabOpenIcon: Icon(
            Icons.qr_code_scanner,
            color: AppColors.kSecondaryColor,
            size: 40,
          ),

          // child: Transform.rotate(
          //   angle: 3.14,
          //   child: Icon(Icons.menu),
          // ),
        ),
      ),
    );
  }
}
