import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/services/global_methods.dart';
import 'package:full_ecommerce_app/widgets/empty_wishlist.dart';
import 'package:full_ecommerce_app/widgets/full_wishlist.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wishlist-screen';

  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishListProvider>(context);
    GlobalMethods _globalMethods = GlobalMethods();
    return wishlistProvider.wishList.isEmpty
        ? const Scaffold(
            body: EmptyWishListScreen(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Whislist (${wishlistProvider.wishList.length})'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await _globalMethods.showDialogue(
                        context, () => wishlistProvider.clearWishList());
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: wishlistProvider.wishList.length,
                itemBuilder: (ctx, i) {
                  return ChangeNotifierProvider.value(
                    value: wishlistProvider.wishList.values.toList()[i],
                    child: FullWishListWidget(
                      productId: wishlistProvider.wishList.keys.toList()[i],
                    ),
                  );
                }),
          );
  }
}
