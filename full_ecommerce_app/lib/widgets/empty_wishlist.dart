import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/screens/home_screen.dart';

class EmptyWishListScreen extends StatelessWidget {
  const EmptyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/empty-wishlist.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Text(
            'Your wishlist is empty',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Looks Like You Did\'t\n   Add Anything Yet',
            style: TextStyle(
              fontSize: 26,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                //Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              child: const Text(
                'Shop Now',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
