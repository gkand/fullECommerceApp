import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class FullCart extends StatefulWidget {
  final String productId;
  // final String id;
  // final String title;
  // final String imageUrl;
  // final int quantity;
  // final double price;

  const FullCart({
    Key? key,
    required this.productId,
    // required this.id,
    // required this.title,
    // required this.imageUrl,
    // required this.quantity,
    // required this.price,
  }) : super(key: key);

  @override
  _FullCartState createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
  @override
  Widget build(BuildContext context) {
    final _cartAttribute = Provider.of<Cart>(context);
    final _cartProvider = Provider.of<CartProvider>(context);

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
                      _cartAttribute.imageUrl,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            _cartAttribute.title,
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
                              _cartProvider.removeItem(widget.productId);
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
                          child: Text('\$${_cartAttribute.price}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'SubTotal : ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Flexible(
                          child: Text(
                              '\$${(_cartAttribute.price * _cartAttribute.quantity).toStringAsFixed(2)}', // Fix this
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          'Shipping : ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Flexible(
                          child: Text('\$ 450.00',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _cartAttribute.quantity < 2
                              ? () {}
                              : () {
                                  _cartProvider.decrementCartProductQuantity(
                                      widget.productId,
                                      _cartAttribute.title,
                                      _cartAttribute.imageUrl,
                                      _cartAttribute.price);
                                },
                          child: const Text(
                            '-',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Text(
                          _cartAttribute.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _cartProvider.addToCart(
                              widget.productId,
                              _cartAttribute.title,
                              _cartAttribute.imageUrl,
                              _cartAttribute.price,
                            );
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 25,
                            ),
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
