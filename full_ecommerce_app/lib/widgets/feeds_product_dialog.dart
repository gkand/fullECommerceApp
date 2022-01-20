import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:provider/provider.dart';

class FeedsProductDialog extends StatelessWidget {
  final Product product;
  const FeedsProductDialog({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<WishListProvider>(builder: (context, wp, _) {
              return CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: IconButton(
                  onPressed: () {
                    wp.addOrRemoveWishList(
                      product.id,
                      product.title,
                      product.imageUrl,
                      product.price,
                    );
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              );
            }),
            CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
