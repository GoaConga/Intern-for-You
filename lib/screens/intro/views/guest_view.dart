import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/controller.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';

class GuestViewScreen extends GetView<IntroController> {
  const GuestViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(ImageConstant.kImgWA,
                            fit: BoxFit.fill)),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: getHorizontalSize(15.00),
                                top: getVerticalSize(75.00),
                                right: getHorizontalSize(15.00),
                                bottom: getVerticalSize(75.00)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: getVerticalSize(10),
                                          left: getHorizontalSize(1.00),
                                          right: getHorizontalSize(10.00)),
                                      child: Text("Would you like to...".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textStyleRobotoCondensedbold24)),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                        child: ElevatedButton(
                                            onPressed: () => Get.toNamed(
                                                AppRoutes.registerScreen),
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(475, 60),
                                                primary: const Color.fromRGBO(
                                                    255, 29, 72, 1)),
                                            child: Text(
                                              "Setup Account".tr,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .textStyleRobotoCondensedbold241,
                                            ))),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(475, 60),
                                                  primary: Colors.white30),
                                              child: Text(
                                                "Continue Anonymously".tr,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .textStyleRobotoCondensedlight24,
                                              ))))
                                ])))
                  ],
                ))));
  }
}
