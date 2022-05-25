import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../theme/app_style.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/routes/app_routes.dart';
import '../controller.dart';
import '../model.dart';
import '../widgets/item_widget.dart';

class SelectionScreen extends GetWidget<IntroController> {
  const SelectionScreen({Key? key}) : super(key: key);

//TODO: This is all figma shit! Get rid out if its unnessary!

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray800,
            body: Container(
                height: getVerticalSize(700.00),
                width: size.width,
                decoration: BoxDecoration(color: ColorConstant.gray800),
                child: Stack(children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: SingleChildScrollView(
                          child: SizedBox(
                              height: getVerticalSize(839.52),
                              width: size.width,
                              child: Stack(alignment: Alignment.centerLeft, children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height: getVerticalSize(213.00),
                                        width: getHorizontalSize(337.00),
                                        margin: EdgeInsets.only(left: getHorizontalSize(11.00), top: getVerticalSize(206.52), right: getHorizontalSize(11.00), bottom: getVerticalSize(206.52)),
                                        child: Stack(alignment: Alignment.centerLeft, children: [
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(left: getHorizontalSize(16.00), top: getVerticalSize(10.00), right: getHorizontalSize(16.00)),
                                                  child: Text("lbl_skip".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textStyleRobotoregular20.copyWith(fontSize: getSize(20))))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(bottom: getVerticalSize(8.00)),
                                                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                    Obx(() => CarouselSlider.builder(
                                                        options:
                                                            CarouselOptions(height: getVerticalSize(159.00), initialPage: 0, autoPlay: true, viewportFraction: 1.0, enableInfiniteScroll: false, scrollDirection: Axis.horizontal, onPageChanged: (index, reason) => controller.silderIndex.value = index),
                                                        itemCount: controller.introModelObj.value.introItemModelList.length,
                                                        itemBuilder: (context, index, realIndex) {
                                                          IntroItemModel model = controller.introModelObj.value.introItemModelList[index];
                                                          return ItemModelWidget(model, onPressed: () => Get.toNamed(AppRoutes.introGuestScreen));
                                                        })),
                                                    Obx(
                                                      () => GestureDetector(
                                                        onTap: () => Get.toNamed(AppRoutes.introGuestScreen),
                                                        child: Container(
                                                          height: getVerticalSize(11.00),
                                                          margin: EdgeInsets.only(left: getHorizontalSize(138.00), top: getVerticalSize(35.00), right: getHorizontalSize(138.00)),
                                                          child: AnimatedSmoothIndicator(
                                                            activeIndex: controller.silderIndex.value,
                                                            count: controller.introModelObj.value.introItemModelList.length,
                                                            axisDirection: Axis.horizontal,
                                                            effect: ScrollingDotsEffect(spacing: 7, activeDotColor: ColorConstant.whiteA700, dotColor: ColorConstant.gray400, dotHeight: getVerticalSize(11.00), dotWidth: getHorizontalSize(11.00)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]))),
                                        ]))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                        height: getVerticalSize(839.52),
                                        width: size.width,
                                        child: Stack(alignment: Alignment.topCenter, children: [
                                          Align(alignment: Alignment.centerLeft, child: Image.asset(ImageConstant.kImgWA, height: getVerticalSize(839.52), width: getHorizontalSize(360.00), fit: BoxFit.fill)),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(left: getHorizontalSize(11.00), top: getVerticalSize(10.00), right: getHorizontalSize(11.00), bottom: getVerticalSize(10.00)),
                                                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                    Padding(padding: EdgeInsets.only(right: getHorizontalSize(10.00)), child: Text("msg_first_time_setu".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textStyleRobotoregular14.copyWith(fontSize: getSize(14)))),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: getHorizontalSize(16.00), top: getVerticalSize(187.00), right: getHorizontalSize(16.00)),
                                                        child: Text("lbl_are_you".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textStyleRobotoCondensedbold24.copyWith(fontSize: getSize(24)))),
                                                    Container(
                                                        height: getVerticalSize(159.00),
                                                        width: getHorizontalSize(337.00),
                                                        margin: EdgeInsets.only(top: getVerticalSize(10.00)),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant.whiteA70066,
                                                            borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
                                                            boxShadow: [BoxShadow(color: ColorConstant.black90040, spreadRadius: getHorizontalSize(2.00), blurRadius: getHorizontalSize(2.00), offset: Offset(0, 4))]),
                                                        child: Card(
                                                            clipBehavior: Clip.antiAlias,
                                                            elevation: 0,
                                                            margin: const EdgeInsets.all(0),
                                                            color: ColorConstant.whiteA70066,
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getHorizontalSize(10.00))),
                                                            child: Stack(alignment: Alignment.centerRight, children: [
                                                              Align(alignment: Alignment.centerLeft, child: Image.asset(ImageConstant.kImgIntern, height: getVerticalSize(159.00), width: getHorizontalSize(337.00), fit: BoxFit.fill)),
                                                              Align(
                                                                  alignment: Alignment.centerRight,
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(left: getHorizontalSize(18.00), top: getVerticalSize(68.00), right: getHorizontalSize(18.00), bottom: getVerticalSize(68.00)),
                                                                      child: Text("msg_looking_for_an2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textStyleRobotoregular20.copyWith(fontSize: getSize(20)))))
                                                            ]))),
                                                    Align(
                                                        alignment: Alignment.center,
                                                        child: Padding(
                                                            padding: EdgeInsets.only(left: getHorizontalSize(16.00), top: getVerticalSize(204.00), right: getHorizontalSize(16.00)),
                                                            child: SizedBox(height: getVerticalSize(11.00), width: getHorizontalSize(60.00), child: SvgPicture.asset(ImageConstant.imgSliderbar2, fit: BoxFit.fill)))),
                                                  ]))),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: TextButton(onPressed: () => Get.toNamed(AppRoutes.introGuestScreen), child: const Text('GuestView')),
                                          ),
                                        ])))
                              ]))))
                ]))));
  }
}
