import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String message;
  final bool withBackground;

  const LoadingView({
    super.key,
    this.message = "Loading...",
    this.withBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final loader = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Circular progress with nice accent
        SizedBox(
          height: 70,
          width: 70,
          child: CircularProgressIndicator(
            strokeWidth: 6,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blueAccent,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Message
        Text(
          message,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );

    return Center(
      child: withBackground
          ? Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.3),
        child: loader,
      )
          : loader,
    );
  }
}
