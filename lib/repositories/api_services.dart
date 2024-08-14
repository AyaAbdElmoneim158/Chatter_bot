import 'dart:developer';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../model/chat_model.dart';
import '../utils/constants/api_constants.dart';

class GoogleGenerativeServices {
  Future<String> getText(String message) async {
    try {
      //! Creates an instance of GenerativeModel with the 'gemini-pro' model and API key
      final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: ApiConstant.apiToken,
      );
      //! Sends a text prompt to the model and receives generated content.
      final response = await model.generateContent([Content.text(message)]);
      //! Returns the generated text or an empty string if an error occurs
      return response.text ?? '';
    } catch (e) {
      log("Error is $e");
    }
    return '';
  }

  Future<ChatModel?> getTextFromImage(File photo, String message) async {
    try {
      //! Creates an instance of GenerativeModel with the 'gemini-pro-vision' model and API key
      final model = GenerativeModel(
        model: 'gemini-pro-vision',
        apiKey: ApiConstant.apiToken,
      );
      //! Prepares the image and text prompt to be sent to the model.
      final prompt = TextPart(message);
      final imageParts = [
        DataPart('image/jpeg', await photo.readAsBytes()),
      ];
      //! Receives the response, returning a ChatModel instance with the generated content or null if an error occurs.
      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts]),
      ]);
      return ChatModel(
        role: response.candidates.first.content.role.toString(),
        text: response.text.toString(),
      );
    } catch (e) {
      log("Error is $e");
    }
    return null;
  }
}
