import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khyaalapp/componemts/my_button.dart';
import 'package:khyaalapp/componemts/my_textfield.dart';
import 'package:khyaalapp/helper/helper_function.dart';

class Registerpage extends StatefulWidget {
  final void Function()? onTap;

  const Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void registerUser() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Make sure password match
    if (passwordController.text != confirmpasswordController.text) {
      Navigator.pop(context);
      displayMessageToUser(
          "Password does not match", context); // Move this inside if block
      return; // Add a return statement to exit the method
    }

    // Try creating a new user
    try {
      // Creating a user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // User created successfully, you may add additional functionality here if needed

      // Dismiss the dialog
      Navigator.pop(context);
    } catch (e) {
      // Dismiss the dialog
      Navigator.pop(context);

      // Handle exceptions
      displayMessageToUser(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            const Text("K H Y A A L", style: TextStyle(fontSize: 20)),

            const SizedBox(height: 50),
            //email
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),

            const SizedBox(height: 20),

            //username
            MyTextField(
              hintText: "username",
              obscureText: false,
              controller: usernameController,
            ),

            const SizedBox(height: 20),

            //password
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),

            const SizedBox(height: 20),

            //confirm password
            MyTextField(
              hintText: "confirm Password",
              obscureText: true,
              controller: confirmpasswordController,
            ),

            //forgetpass
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                ),
              ],
            ),
            const SizedBox(height: 35),
            //register Button

            MyButton(
              text: "register",
              onTap: registerUser,
              backgroundColor: Colors.blue,
              textColor: Colors.black,
            ),
            const SizedBox(height: 25),

            //dont have an account?Register here

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontStyle: FontStyle.normal),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Login Here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
