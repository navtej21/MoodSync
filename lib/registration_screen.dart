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
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: nameController,
                  labelText: 'Name',
                  textColor: const Color.fromARGB(255, 239, 230, 230),
                ),
                const SizedBox(height: 24),
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
        SizedBox(
          width: 200,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              register(emailController.text, passwordController.text,
                  nameController.text);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
            child: const Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => LoginScreen(account: widget.account)),
            );
          },
          child: const Text(
            "Already Have An Account? Login!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
