import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

Future<String> generateContent(String prompt) async {
  final apikey = "AIzaSyAviidiGupw3lv4YGlvqGwk-tGD4OHIsDc";

  final model = GenerativeModel(
    model: "gemini-1.5-flash",
    apiKey: apikey,
  );

  final response = await model.generateContent([Content.text(prompt)]);

  return response.text.toString();
}
