import 'package:flutter/material.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _rotatedBox(top: -100, left: -28),
        _rotatedBox(top: -100, left: 200),
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
                    padding: EdgeInsets.all(8),
                    child: Image.network(
                      "https://avatars0.githubusercontent.com/u/8186664?s=460&u=f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8&v=4",
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _backLayerButton(
                  icon: Icons.home,
                  onPressed: () {},
                  title: 'Home Screen',
                ),
                _backLayerButton(
                  icon: Icons.rss_feed,
                  onPressed: () {},
                  title: 'Feeds Screen',
                ),
                _backLayerButton(
                  icon: Icons.search,
                  onPressed: () {},
                  title: 'Search Screen',
                ),
                _backLayerButton(
                  icon: Icons.shopping_bag,
                  onPressed: () {},
                  title: 'Card Screen',
                ),
                _backLayerButton(
                  icon: Icons.person,
                  onPressed: () {},
                  title: 'User Screen',
                ),
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
