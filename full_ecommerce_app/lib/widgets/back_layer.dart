// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _rotatedBox(top: -100, left: -28),
        const _rotatedBox(top: -100, left: 200),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      "https://avatars0.githubusercontent.com/u/8186664?s=460&u=f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8&v=4",
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _backLayerButton(
                  icon: Icons.upload,
                  onPressed: () {},
                  title: 'Upload Product',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _rotatedBox extends StatelessWidget {
  final double top;
  final double left;
  const _rotatedBox({
    Key? key,
    required this.top,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _backLayerButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const _backLayerButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
