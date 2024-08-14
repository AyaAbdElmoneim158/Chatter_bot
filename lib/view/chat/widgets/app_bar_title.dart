import 'package:flutter/material.dart';

import '../../../utils/constants/color_constant.dart';
import '../../../utils/constants/image_constants.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/widgets/common_text.dart';

Row buildAppBarTitle() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Image.asset(
            height: 45,
            width: 45,
            ImageConstant.aiIcon,
            fit: BoxFit.fill,
          ),
        ),
      ),
      CommonText(
        text: StringConstants.chatAppTitle,
        color: ColorConstants.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}
