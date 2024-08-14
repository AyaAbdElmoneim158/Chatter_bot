import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import '../../../utils/widgets/common_sized_box.dart';
import '../../../viewmodel/chat_view_model.dart';
import 'app_bar_title.dart';
import 'chat_message.dart';
import 'chat_message_field.dart';

Widget buildChatBody(BuildContext context, ChatViewModel model) {
  return Column(
    children: [
      CommonSizedBox(height: 10),
      buildAppBarTitle(),
      CommonSizedBox(height: 20),
      buildChatMessage(model),
      buildChatMessageField(model, context),
      model.isEmojiPicker == true
          ? Expanded(
              child: EmojiPicker(
                textEditingController: model.messageController,
              ),
            )
          : CommonSizedBox()
    ],
  );
}
