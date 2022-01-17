import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds-screen';

  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds Screen'),
      ),
    );
  }
}
