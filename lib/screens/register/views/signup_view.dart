import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/utils/theme/colors.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
// import '../../../utils/routes/app_routes.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

final _username = TextEditingController();
final _email = TextEditingController();
final _password = TextEditingController();

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray800,
            body: SizedBox(
                width: size.width,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Align(
                      alignment: Alignment.center,
                      child:
                          Image.asset(ImageConstant.kImgWA, fit: BoxFit.fill)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Basic Accont Details',
                                  style:
                                      AppStyle.textStyleRobotoCondensedbold24),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _username,
                            decoration: const InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _password,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        ),
                      ]),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                        child: Align(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(475, 60),
                                    primary:
                                        const Color.fromRGBO(255, 29, 72, 1)),
                                child: Text(
                                  "Register Account".tr,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.textStyleRobotoCondensedlight24,
                                )))),
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                        child: Align(
                            child: ElevatedButton(
                                onPressed: () {
                                  doUserRegistration();
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(475, 60),
                                    primary: Colors.white30),
                                child: Text(
                                  "Continue Anonymously".tr,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.textStyleRobotoCondensedlight24,
                                ))))
                  ])
                ])))
        // )
        );
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            // new FlatButton(
            //   child: const Text("OK"),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SecondRoute()),
            //     );
            //   },
            // ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserRegistration() async {
    final username = _username.text.trim();
    final password = _password.text.trim();

    final user = ParseUser.createUser(username, password);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }
}
