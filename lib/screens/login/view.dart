import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/login/controller.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'widgets/ify_textfields.dart';


class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Login', style: IFYFonts.introHeader),
                      Container()
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                        child: primaryTextField('email address', 'example@mail.com', false, emailController, TextInputType.emailAddress, 1, 30)
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 2),
                        child: primaryTextField('password', 'password', true, passwordController, TextInputType.visiblePassword, 1, 30)
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ElevatedButton(
                          child: const Text('Login'),
                          style: IFYButtons.primaryButton,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint("Username: ${emailController.text}\nPassword: ${passwordController.text}");
                              //TODO: Continue if passed
                            } else {
                              debugPrint('false');
                            }  
                          }, 
                        ),
                      ),
                      ElevatedButton(
                      onPressed: () {}, //TODO: Handle on press
                      child: const Text('Register'), style: IFYButtons.secondaryButton),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
