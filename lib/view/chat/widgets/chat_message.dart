import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/widgets/message_body.dart';

Widget buildChatMessage(model) {
  return Expanded(
    child: ListView.builder(
      controller: model?.scrollController,
      shrinkWrap: true,
      itemCount: model?.chatList.length ?? 0,
      itemBuilder: (context, index) {
        int last = (model?.chatList.length ?? 0);
        ChatModel? data;
        if (model?.chatList[index] != null) {
          data = model?.chatList[index];
        }
        bool isLoading = index + 1 == last &&
            data?.role != StringConstants.user &&
            data?.text == '';
        return MessageBody(chatModel: data, isLoading: isLoading);
      },
    ),
  );
}
