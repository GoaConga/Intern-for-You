import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart' as v;
import 'package:internsforyou/screens/register/controller.dart';
import 'package:internsforyou/utils/image_constant.dart';
import 'package:internsforyou/widgets/primary_btn.dart';
import 'package:internsforyou/widgets/text_field.dart';
import 'package:get/get.dart';
import '../../../theme/app_style.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/extentions.dart';
import '../../../widgets/page_indicator.dart';

class UserDetailsScreen extends GetView<RegisterController> {
  const UserDetailsScreen({Key? key}) : super(key: key);

  final bool isCompamy = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.kImgWA), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: FormBuilder(
              key: controller.signupDetailsKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0.hp),
                    Text(
                      '${isCompamy ? 'Company' : 'Personal'} Details',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textStyleRobotoCondensedbold24.copyWith(fontSize: getSize(24)),
                    ),
                    SizedBox(height: 8.0.hp),
                    Text(isCompamy ? 'Company' : 'First' ' Name', style: AppStyle.textStyleRobotoregular14),
                    AppTextField(
                      label: 'Last Name',
                      captitalise: true,
                      type: TextInputType.name,
                      icon: Icons.person,
                      validator: [v.FormBuilderValidators.required(context, errorText: 'validator_name'.tr)],
                    ),
                    SizedBox(height: 2.0.hp),
                    if (!isCompamy) Text('Last Name', style: AppStyle.textStyleRobotoregular14),
                    if (!isCompamy) const AppTextField(label: 'First Name', validator: []),
                    if (!isCompamy) SizedBox(height: 2.0.hp),
                    Text('Short Bio', style: AppStyle.textStyleRobotoregular14),
                    const AppTextField(
                      label: 'bio',
                      validator: [],
                      minLines: 10,
                      maxLines: 100,
                      type: TextInputType.multiline,
                      hint: 'Enter Your Bio',
                    ),
                    SizedBox(height: 3.0.hp),
                    //TODO: Create the next page
                    //TODO: Navigate to the next page
                    PrimaryBtn(onPressed: () {}),
                    SizedBox(height: 1.0.hp),
                    //TODO: Once Controller has index Page number pass it here
                    //controller.
                    PageIndicator(controller.pageIndex())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
