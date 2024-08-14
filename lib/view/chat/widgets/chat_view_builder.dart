import 'package:flutter/material.dart';

import '../../../utils/constants/color_constant.dart';
import '../../../utils/constants/image_constants.dart';
import '../../../viewmodel/chat_view_model.dart';
import 'chat_body.dart';

class ChatViewBuilder extends StatelessWidget {
  final ChatViewModel model;
  final BuildContext context;

  const ChatViewBuilder({
    super.key,
    required this.model,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          ImageConstant.backGroundImage,
        ),
      ),
    );
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          model.keyboardAppear(false);
          model.showEmojiPicker(false);
        },
        child: Container(
          decoration: boxDecoration,
          child: Scaffold(
            backgroundColor: ColorConstants.transparent,
            body: buildChatBody(context, model),
          ),
        ),
      ),
    );
  }
}
