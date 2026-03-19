import 'package:firebase_auth_app/Screens/login_screen.dart';
import 'package:firebase_auth_app/Services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.email});
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('data', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
