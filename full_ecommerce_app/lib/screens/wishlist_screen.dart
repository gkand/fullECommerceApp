import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/widgets/empty_wishlist.dart';
import 'package:full_ecommerce_app/widgets/full_wishlist.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wishlist-screen';

  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _products = [];

    return !_products.isEmpty
        ? const Scaffold(
            body: EmptyWishListScreen(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Whislist'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, i) {
                    return const FullWishListWidget();
                  }),
            ),
          );
  }
}
