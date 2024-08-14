import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../model/chat_model.dart';
import '../repositories/api_services.dart';
import '../utils/constants/string_constants.dart';
import 'base_model.dart';

class ChatViewModel extends BaseModel {
  //! Fields - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  GoogleGenerativeServices generativeServices = GoogleGenerativeServices();

  String? _fileName;
  File? _photo;
  ImagePicker? _imagePicker = ImagePicker();
  List<ChatModel> chatList = [];
  bool? _isTyping, _isEmojiPicker;

//! Getters and Setters - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  bool? get isEmojiPicker => _isEmojiPicker;
  bool? get isTyping => _isTyping;
  File? get photo => _photo;
  String? get fileName => _fileName;
  ImagePicker? get imagePicker => _imagePicker;
  set setImagePicker(ImagePicker setImagePicker) =>
      _imagePicker = setImagePicker;
  set setFileName(String setFileName) => _fileName = setFileName;
  set setPhoto(File? setPhoto) => _photo = setPhoto;
  set setEmojiPicker(bool setEmojiPicker) => _isEmojiPicker = setEmojiPicker;
  set setTyping(bool setTyping) => _isTyping = setTyping;

//! keyboardAppear - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  keyboardAppear(bool value) {
    setTyping = value;
    updateUI();
  }

//! showEmojiPicker - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  showEmojiPicker(bool value) {
    setEmojiPicker = value;
    updateUI();
  }

//! scrollMessages [Scrolls the chat to the bottom] - - - - - - - - - - - - - -
  scrollMessages() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 120,
      duration: const Duration(milliseconds: 5),
      curve: Curves.easeOut,
    );
  }

//! imgFromDevice [Opens the image picker to select an image] - - - - - - - - -
  Future imgFromDevice(ImageSource source) async {
    final pickedFile = await imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      setPhoto = File(pickedFile.path);
      setFileName = basename(photo?.path ?? "");
      updateUI();
    } else {
      debugPrint('No image selected.');
    }
  }

//!  Handles sending messages and receiving responses. Adds user messages to chatList, interacts with the GoogleGenerativeServices to get responses, and updates chatList. Calls scrollMessages() and updateUI() to reflect changes.
  getChat() async {
    //! Get the current image -> Add the user's message -> Scroll to the bottom -> Notify listeners
    File? image = photo; // log(image.toString());
    chatList.add(
      ChatModel(
        role: StringConstants.user,
        text: messageController.text,
        photo: photo,
      ),
    );
    scrollMessages();
    updateUI();

    //! Clear the photo -> Add placeholder message -> Scroll to the bottom -> Notify listeners
    setPhoto = null;
    chatList.add(
      ChatModel(
        role: 'model',
        text: '',
        photo: null,
      ),
    );
    scrollMessages();
    updateUI();

    //! If there's an image (generativeServices.getTextFromImage) .... else (generativeServices.getText)
    int index = chatList.length - 1;
    if (image != null) {
      //! process it with the generative service -> Add placeholder message -> Add the model's response
      final chatData = await generativeServices.getTextFromImage(
          image, messageController.text);
      chatList.removeAt(index);
      chatList.add(
          ChatModel(role: chatData?.role ?? '', text: chatData?.text ?? ''));
    } else {
      //! process it with the generative service -> Add placeholder message -> Add the model's response
      String data = await generativeServices.getText(messageController.text);
      chatList.removeAt(index);
      chatList.add(ChatModel(text: data, role: 'model'));
      updateUI();
    }

    //! Scroll to the bottom -> Notify listeners
    scrollMessages();
    updateUI();
  }
}
