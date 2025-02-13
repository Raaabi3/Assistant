import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButtons({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [Icon(Icons.home_filled), Text("Homescreen")],
        ));
  }
}
