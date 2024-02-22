import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      required MaterialColor backgroundColor,
      required Color textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 44, 140, 12),
          borderRadius: BorderRadius.circular(60),
        ),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
