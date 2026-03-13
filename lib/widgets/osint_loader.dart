import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OsintLoader extends StatelessWidget {
  final String text;

  const OsintLoader({
    super.key,
    this.text = "FETCHING MIRROR PARLIAMENT DATA...",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              color: Theme.of(context).primaryColor,
              minHeight: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          )
          .animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: const Duration(milliseconds: 1500), color: Colors.black), 
        ],
      ),
    );
  }
}