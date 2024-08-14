import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

class CommonEmojiButton extends StatelessWidget {
  const CommonEmojiButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.emoji_emotions,
        color: ColorConstants.white38,
      ),
    );
  }
}
