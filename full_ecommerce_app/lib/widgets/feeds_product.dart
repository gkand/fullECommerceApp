import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';
import 'package:full_ecommerce_app/widgets/feeds_product_dialog.dart';
import 'package:provider/provider.dart';

class FeedsProduct extends StatefulWidget {
  const FeedsProduct({Key? key}) : super(key: key);

  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    final _productsAttribute = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: _productsAttribute.id,
        );
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                        minHeight: 130,
                        maxHeight: MediaQuery.of(context).size.height * 0.24),
                    child: Image.network(
                      _productsAttribute.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _productsAttribute.description,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$ ${_productsAttribute.price}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantoity ${_productsAttribute.quantity} left',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: IconButton(
              onPressed: () async {
                return showDialog(
                    context: context,
                    builder: (ctx) => FeedsProductDialog(
                          product: _productsAttribute,
                        ));
              },
              icon: const Icon(Icons.more_horiz),
            ),
          ),
          Badge(
            toAnimate: true,
            animationType: BadgeAnimationType.scale,
            shape: BadgeShape.square,
            badgeColor: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(8),
            badgeContent: const Text(
              'NEW',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
