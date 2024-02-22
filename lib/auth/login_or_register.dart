import 'package:flutter/material.dart';
import 'package:khyaalapp/pages/login_page.dart';
import 'package:khyaalapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrregisterState();
}

class _LoginOrregisterState extends State<LoginOrRegister> {
  //initially, show login page
  bool showLoginPage = true;

  //toggles between two pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return Registerpage(onTap: togglePages);
    }
  }
}
