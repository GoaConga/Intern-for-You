import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internsforyou/screens/intro/controller.dart';
import 'package:internsforyou/theme/app_style.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';
import 'package:internsforyou/utils/color_constant.dart';
import 'package:internsforyou/utils/image_constant.dart';
import 'package:internsforyou/utils/math_utils.dart';
import 'package:internsforyou/utils/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends GetView<IntroController> {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray800,
            body: Container(
                decoration: BoxDecoration(color: ColorConstant.gray800),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                      top: getVerticalSize(189.00),
                                      bottom: getVerticalSize(67.00)),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(28.00),
                                          right: getHorizontalSize(29.00)),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                ImageConstant.kImgCroppedWA,
                                                height: getVerticalSize(205.00),
                                                width:
                                                    getHorizontalSize(303.00),
                                                fit: BoxFit.fill),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            61.00),
                                                        top: getVerticalSize(
                                                            12.00),
                                                        right: getHorizontalSize(
                                                            61.00)),
                                                    child: Text(
                                                        "lbl_interns_for_you"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textStyleRobotoCondensedbold24
                                                            .copyWith(
                                                                fontSize:
                                                                    getSize(
                                                                        24))))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            61.00),
                                                        top: getVerticalSize(
                                                            12.00),
                                                        right: getHorizontalSize(
                                                            61.00)),
                                                    child: Text(
                                                        "msg_subtext_introdu"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textStyleRobotoregular20
                                                            .copyWith(
                                                                fontSize:
                                                                    getSize(
                                                                        20))))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                    onTap: controller
                                                        .onTapBottomPrompts,
                                                    child: Padding(
                                                        padding: EdgeInsets.only(
                                                            top:
                                                                getVerticalSize(
                                                                    137.00),
                                                            right:
                                                                getHorizontalSize(
                                                                    5.00)),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                  "lbl_skip".tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .textStyleRobotoregular20
                                                                      .copyWith(
                                                                          fontSize:
                                                                              getSize(20))),
                                                              Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          11.00),
                                                                  margin: EdgeInsets.only(
                                                                      top: getVerticalSize(
                                                                          8.00),
                                                                      bottom: getVerticalSize(
                                                                          8.00)),
                                                                  child: SmoothIndicator(
                                                                      offset: 0,
                                                                      count: 3,
                                                                      axisDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      effect: ScrollingDotsEffect(
                                                                          spacing:
                                                                              6,
                                                                          activeDotColor: ColorConstant
                                                                              .whiteA700,
                                                                          dotColor: ColorConstant
                                                                              .gray400,
                                                                          dotHeight: getVerticalSize(
                                                                              11.00),
                                                                          dotWidth:
                                                                              getHorizontalSize(11.00)))),
                                                              Text(
                                                                  "lbl_next2"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .textStyleRobotoregular20
                                                                      .copyWith(
                                                                          fontSize:
                                                                              getSize(20)))
                                                            ]))))
                                          ])))))
                    ]))));
  }
}
