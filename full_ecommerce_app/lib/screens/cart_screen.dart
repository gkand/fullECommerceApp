import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/screens/home_screen.dart';
import 'package:full_ecommerce_app/services/global_methods.dart';
import 'package:full_ecommerce_app/widgets/empty_cart.dart';
import 'package:full_ecommerce_app/widgets/full_cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    GlobalMethods _globalMethods = GlobalMethods();
    return _cartProvider.cartList.isEmpty
        ? const Scaffold(
            body: EmptyCart(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart (${_cartProvider.cartList.length})'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await _globalMethods.showDialogue(
                        context, () => _cartProvider.clearCart());
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: _cartProvider.cartList.length,
                  itemBuilder: (ctx, i) {
                    return ChangeNotifierProvider.value(
                      value: _cartProvider.cartList.values.toList()[i],
                      child: FullCart(
                        productId: _cartProvider.cartList.keys.toList()[i],
                      ),
                    );
                  }),
            ),
            bottomSheet: _bottomCheckOutSection(_cartProvider.totalAmount),
          );
  }
}

Widget _bottomCheckOutSection(double totalAmount) {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Total: \$ ${totalAmount.toStringAsFixed(2)}',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
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
