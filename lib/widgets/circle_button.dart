import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.playColor,
  });
  final Color playColor;
  @override
  Widget build(BuildContext context) {
    double? dimension = MediaQuery.of(context).size.width * 0.65;
    return Center(
      child: Card(
        color: const Color(0xFF1F1F1F),
        shape: const CircleBorder(),
        elevation: 10,
        child: Container(
          width: dimension,
          height: dimension,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(dimension),
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.78,
              colors: [
                const Color.fromARGB(255, 21, 103, 244),
                const Color.fromARGB(255, 21, 103, 244).withOpacity(0.4),
              ],
            ),
          ),
          child: Icon(
            color: playColor,
            Icons.headphones_rounded,
            size: dimension * 0.6,
          ),
        ),
      ),
    );
  }
}
