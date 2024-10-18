import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Todo",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "Time Left 0",
          style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
        )
      ],
    );
  }
}
