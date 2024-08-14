import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/constants/color_constant.dart';
import '../../../utils/widgets/common_emoji_button.dart';
import '../../../utils/widgets/message_field.dart';
import '../../../utils/widgets/pop_up_menu.dart';
import '../../../viewmodel/chat_view_model.dart';

MessageField buildChatMessageField(ChatViewModel model, BuildContext context) {
  return MessageField(
    chatViewModel: model,
    onClipTap: () {
      _showPicker(context, model);
      model.setEmojiPicker = false;
    },
    emojiWidget: CommonEmojiButton(
      onPressed: () {
        model.showEmojiPicker(true);
        FocusScope.of(context).unfocus();
      },
    ),
  );
}

_showPicker(context, model) {
  showModalBottomSheet(
    backgroundColor: ColorConstants.transparent,
    context: context,
    builder: (BuildContext context) {
      return PopUpMenuWidget(
        onTapCamera: () {
          model?.imgFromDevice(ImageSource.camera);
          Navigator.pop(context);
        },
        onTapGalley: () {
          model?.imgFromDevice(ImageSource.gallery);
          Navigator.pop(context);
        },
      );
    },
  );
}
