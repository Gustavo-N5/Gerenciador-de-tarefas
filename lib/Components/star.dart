import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final int dificulty;
  const Star({super.key, required this.dificulty});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15, color: (dificulty >= 1) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (dificulty >= 2) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (dificulty >= 3) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (dificulty >= 4) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 15, color: (dificulty >= 5) ? Colors.blue : Colors.blue[100]),
      ],
    );
  }
}
