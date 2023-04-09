import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/shared/app_color.dart';
import 'package:testapp/ui/views/signup/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final isChecked = false;
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) => Scaffold(
              //  resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 6.5,
                        //  color: AppColors.kPrimaryColor,
                        child: Image.asset(
                          'assets/kacha.png',
                          // width: MediaQuery.of(context).size.width / 2,
                          // height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text("English")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name cant be empty ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Username',
                                // hintText: 'Enter Username',

                                prefixIcon: const Icon(
                                  Icons.supervised_user_circle,
                                  color: AppColors.kPrimaryColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'email cant be empty ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                //hintText: 'Enter your email',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.kPrimaryColor,
                                ),
                                suffixIcon: const Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.kPrimaryColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          value: true,
                                          onChanged: (value) =>
                                              model.checkBoxStatus),
                                      const Text("Remeber me",
                                          style: TextStyle(
                                              color: AppColors.kPrimaryColor))
                                    ],
                                  ),
                                  const Text("Forget Password ? "),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.kSecondaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: AppColors.kSecondaryColor,
                                      width: 2),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Sending data"),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
