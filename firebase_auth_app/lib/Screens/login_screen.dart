import 'package:firebase_auth_app/Screens/register_screen.dart';
import 'package:firebase_auth_app/Services/auth_service.dart';
import 'package:firebase_auth_app/Widgets/button_widget.dart';
import 'package:firebase_auth_app/Widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  'L o g i n',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 30),
                Text(
                  'W e l c o m e\nb a c k',
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
                SizedBox(height: 50),
                ButtonWidget(
                  widget: Text('Login'),
                  onTap: () {
                    AuthService().signinWithEmail(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
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
