import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import 'package:music_recommender_application/components/toogle_page.dart';

class LoginScreen extends StatefulWidget {
  final Account account;

  LoginScreen({required this.account});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginScreen> {
  models.User? loggedInUser;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      await widget.account
          .createEmailPasswordSession(email: email, password: password);
      final user = await widget.account.get();
      setState(() {
        loggedInUser = user;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Color.fromARGB(255, 99, 7, 7),
              Color.fromARGB(255, 16, 15, 15),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'MoodSync',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: emailController,
                  labelText: 'Enter Email',
                  textColor: const Color.fromARGB(255, 239, 230, 230),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: passwordController,
                    labelText: 'Enter Password',
                    textColor: const Color.fromARGB(255, 239, 230, 230),
                    obscureText: true),
                const SizedBox(height: 16),
                _buildButtonRow()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    Color textColor = Colors.black,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        TextButton(
          onPressed: () {
            login(emailController.text, passwordController.text);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TooglePage()));
          },
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
