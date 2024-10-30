import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegistrationPage extends StatefulWidget {
  final Account account;

  RegistrationPage({required this.account});

  @override
  _RegistrationPage createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  models.User? loggedInUser;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> register(String email, String password, String name) async {
    try {
      await widget.account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(account: widget.account)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration Error")));
    }
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
              _buildTextField(controller: nameController, labelText: 'Name'),
              SizedBox(height: 24),
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
        SizedBox(
          width: 200,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              register(emailController.text, passwordController.text,
                  nameController.text);
            },
            child: Text("Register"),
          ),
        ),
        SizedBox(height: 15),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => LoginScreen(account: widget.account)),
            );
          },
          child: Text("Already Have An Account? Login!"),
        ),
      ],
    );
  }
}
