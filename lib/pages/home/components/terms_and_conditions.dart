import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final VoidCallback onAcceptConditions;

  const TermsAndConditions({super.key, required this.onAcceptConditions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'The content of the app can not be shared with anyone.'
            'By accepting, you agree to the terms and conditions.',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onAcceptConditions,
            child: const Text(
              'Accept',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
