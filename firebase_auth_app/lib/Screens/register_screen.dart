import 'package:firebase_auth_app/Screens/login_screen.dart';
import 'package:firebase_auth_app/Services/auth_service.dart';
import 'package:firebase_auth_app/Widgets/button_widget.dart';
import 'package:firebase_auth_app/Widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool newloading = false;

  var formKey = GlobalKey<FormState>();

  Future<void> verification() async {
    setState(() {
      newloading = true;
    });
    await AuthService()
        .signupWithEmail(
          _emailController.text.toString(),
          _passwordController.text.toString(),
        )
        .then((value) {
          setState(() {
            newloading = false;
          });
        })
        .onError((error, stackTrace) {
          setState(() {
            newloading = false;
          });
          debugPrint('$error');
        });
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                      // TextFieldWidget(
                      //   hintText: 'Confirm Password',
                      //   controller: _confirmPasswordController,
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ButtonWidget(
                  isloading: newloading,
                  widget: Text('Register'),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      verification();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginScreen()),
                      // );
                    }
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
