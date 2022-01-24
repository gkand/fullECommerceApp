import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/screens/bottom_nav_screen.dart';
import 'package:full_ecommerce_app/screens/landing_screen.dart';
import 'package:full_ecommerce_app/screens/upload_product_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        BottomNavScreen(),
        UploadProductScreen(),
      ],
    );
  }
}
