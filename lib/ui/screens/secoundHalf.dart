import 'package:flutter/material.dart';

class SecoundScreen extends StatelessWidget {
  final String result;

  SecoundScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$result'),
    );
  }
}
