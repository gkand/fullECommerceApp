import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/widgets/empty_card.dart';
import 'package:full_ecommerce_app/widgets/full_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.cartList.isEmpty
        ? const Scaffold(
            body: EmptyCard(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
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
                  itemCount: cartProvider.cartList.length,
                  itemBuilder: (ctx, i) {
                    return FullCard(
                      productId: cartProvider.cartList.keys.toList()[i],
                      id: cartProvider.cartList.values.toList()[i].cartId,
                      imageUrl:
                          cartProvider.cartList.values.toList()[i].imageUrl,
                      title: cartProvider.cartList.values.toList()[i].title,
                      price: cartProvider.cartList.values.toList()[i].price,
                      quantity:
                          cartProvider.cartList.values.toList()[i].quantity,
                    );
                  }),
            ),
            bottomSheet: _bottonCheckOutSection(),
          );
  }
}

Widget _bottonCheckOutSection() {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'Total: \$ 450.00',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              '   C H E C K O U T   ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
