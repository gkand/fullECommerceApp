import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/wishlist_screen.dart';
import 'package:full_ecommerce_app/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds-screen';

  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final popular = ModalRoute.of(context)!.settings.arguments.toString();
    List<Product> _products = [];
    _products = productProvider.products();

    if (popular == 'popular') {
      _products = productProvider.popularProducts;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds Screen'),
        centerTitle: true,
        actions: [
          Consumer<WishListProvider>(
            builder: (context, wp, _) {
              return Badge(
                toAnimate: true,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(wp.wishList.length.toString()),
                child: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishListScreen.routeName);
                  },
                ),
              );
            },
          ),
          Consumer<CartProvider>(
            builder: (context, cp, _) {
              return Badge(
                toAnimate: true,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(cp.cartList.length.toString()),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: _products[index],
            child: const FeedsProduct(),
          ),
        ),
      ),
    );
  }
}
