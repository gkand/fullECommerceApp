import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/widgets/empty_card.dart';
import 'package:full_ecommerce_app/widgets/full_card.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _products = [];

    return !_products.isEmpty
        ? Scaffold(
            body: EmptyCard(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, i) {
                    return FullCard();
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
          Expanded(
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
            child: Text(
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
