import 'package:firebase_auth_app/Screens/login_screen.dart';
import 'package:firebase_auth_app/Services/auth_service.dart';
import 'package:firebase_auth_app/Widgets/button_widget.dart';
import 'package:firebase_auth_app/Widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void showErrorMassage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> verification(BuildContext context) async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      return showErrorMassage(context, 'Fill all the form');
    }
    if (!_emailController.text.endsWith('@gmail.com'))
      return showErrorMassage(context, 'Enter a valid email');
    // if (_passwordController != _confirmPasswordController) return showErrorMassage(context,' Enter same password ');
    await AuthService().signupWithEmail(
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'R e g i s t e r',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 30),
                Text(
                  'W e l c o m e',
                  textAlign: .center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 100),
                TextFieldWidget(
                  hintText: 'Email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  hintText: 'Password',
                  controller: _passwordController,
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  hintText: 'Confirm Password',
                  controller: _confirmPasswordController,
                ),
                SizedBox(height: 50),
                ButtonWidget(
                  widget: Text('Register'),
                  onTap: () {
                    verification(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                  },
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
