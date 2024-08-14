import 'package:chatter_bot/utils/widgets/common_emoji_button.dart';
import 'package:chatter_bot/utils/widgets/common_menu_button.dart';
import 'package:flutter/material.dart';

class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonEmojiButton(onPressed: () {
            debugPrint("onPressed: CommonEmojiButton");
          }),
          CommonMenuButton(onTap: () {
            debugPrint("onPressed: CommonMenuButton");
          }),
        ],
      ),
    );
  }
}
