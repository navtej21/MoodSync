import 'package:flutter/material.dart';
import 'package:music_recommender_application/components/toogle_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:music_recommender_application/constants.dart';
import 'package:music_recommender_application/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final client =
      Client().setEndpoint(APPWRITE_URL).setProject(APPWRITE_PROJECT_ID);
  Account account = Account(client);
  runApp(MaterialApp(
    home: RegistrationPage(account: account),
  ));
}
