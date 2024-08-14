import 'package:flutter/material.dart';
import '../../viewmodel/chat_view_model.dart';
import 'base_view.dart';
import 'widgets/chat_view_builder.dart';

// ignore: must_be_immutable
class ChatView extends StatelessWidget {
  ChatView({super.key});
  ChatViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) => this.model = model,
      builder: (context, model, child) => ChatViewBuilder(
        model: model,
        context: context,
      ),
    );
  }
}
