import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class FullWishListWidget extends StatefulWidget {
  final String productId;

  const FullWishListWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<FullWishListWidget> createState() => _FullWishListWidgetState();
}

class _FullWishListWidgetState extends State<FullWishListWidget> {
  @override
  Widget build(BuildContext context) {
    final _wishListAttribute = Provider.of<WishList>(context);
    final _whisListProvider = Provider.of<WishListProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: widget.productId,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(
                      _wishListAttribute.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            _wishListAttribute.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              _whisListProvider.removeItem(widget.productId);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 24,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        const Text(
                          'Price : ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '\$${_wishListAttribute.price.toStringAsFixed(2)}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
