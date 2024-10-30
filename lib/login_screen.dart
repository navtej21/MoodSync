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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'MoodSync',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildTextField(
                  controller: emailController, labelText: 'Enter Email'),
              SizedBox(height: 16),
              _buildTextField(
                  controller: passwordController,
                  labelText: 'Enter Password',
                  obscureText: true),
              SizedBox(height: 16),
              _buildButtonRow()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String labelText,
      bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        TextButton(
          onPressed: () {
            login(emailController.text, passwordController.text);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => TooglePage()));
          },
          child: Text("Login"),
        ),
      ],
    );
  }
}
