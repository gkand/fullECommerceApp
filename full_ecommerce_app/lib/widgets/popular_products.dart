import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productAttribute = Provider.of<Product>(context);
    final _cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 190,
                  width: 250,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: _productAttribute.id,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        _productAttribute.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: IconButton(
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        child: Text(
                          '\$ ${_productAttribute.price}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ' ${_productAttribute.title}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      ' ${_productAttribute.description} ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap:
                        _cartProvider.cartList.containsKey(_productAttribute.id)
                            ? () {}
                            : () {
                                _cartProvider.addToCart(
                                  _productAttribute.id,
                                  _productAttribute.title,
                                  _productAttribute.imageUrl,
                                  _productAttribute.price,
                                );
                              },
                    child:
                        _cartProvider.cartList.containsKey(_productAttribute.id)
                            ? const Icon(Icons.check)
                            : const Icon(Icons.shopping_cart),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
