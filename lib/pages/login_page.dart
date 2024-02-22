import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khyaalapp/componemts/my_button.dart';
import 'package:khyaalapp/componemts/my_textfield.dart';
import 'package:khyaalapp/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (context.mounted) Navigator.pop(context);
    }
    //any firebase error
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80),
            SizedBox(height: 10),

            Text("K H Y A A L", style: TextStyle(fontSize: 20)),

            SizedBox(height: 50),
            //email
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),

            SizedBox(height: 20),
            //password
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),

            SizedBox(height: 5),

            //forgetpass
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                ),
              ],
            ),
            SizedBox(height: 35),
            //signin Button

            MyButton(
              text: "Login",
              onTap: login,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
            ),
            SizedBox(height: 25),

            //dont have an account?Register here

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontStyle: FontStyle.normal),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now",
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:khyaalapp/componemts/my_button.dart';
// import 'package:khyaalapp/componemts/my_textfield.dart';
// import 'package:khyaalapp/helper/helper_function.dart';

// class LoginPage extends StatefulWidget {
//   final Function()? onTap;

//    LoginPage({Key? key, required this.onTap}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void login() async {
//     showDialog(
//       context: context,
//       builder: (context) =>  Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       if (context.mounted) Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       displayMessageToUser(e.code, context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding:  EdgeInsets.all(25.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.person,
//                 size: 80,
//               ),
//                SizedBox(height: 25),
//                Text(
//                 "K H Y A A L",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     backgroundColor: Colors.green),
//               ),
//                SizedBox(height: 50),
//               MyTextField(
//                 hintText: "Email",
//                 obscureText: false,
//                 controller: emailController,
//               ),
//                SizedBox(height: 20),
//               MyTextField(
//                 hintText: "Password",
//                 obscureText: true,
//                 controller: passwordController,
//               ),
//                SizedBox(height: 5),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "Forgot Password?",
//                     style: TextStyle(
//                       backgroundColor: Colors.grey.shade300,
//                     ),
//                   ),
//                 ],
//               ),
//                SizedBox(height: 35),
//               MyButton(
//                 text: "Login",
//                 onTap: login,
//               ),
//                SizedBox(height: 25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                    Text(
//                     "Don't have an account?",
//                     style: TextStyle(fontStyle: FontStyle.normal),
//                   ),
//                   GestureDetector(
//                     onTap: widget.onTap,
//                     child:  Text(
//                       "Register Now",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
