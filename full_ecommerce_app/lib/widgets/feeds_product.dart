import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';

class FeedsProduct extends StatefulWidget {
  final String id;
  final String description;
  final double price;
  final String imageUrl;
  final int quantity;
  final bool isFavorite;

  const FeedsProduct({
    Key? key,
    required this.id,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.isFavorite,
  }) : super(key: key);

  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
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
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ ${widget.price}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantoity ${widget.quantity} left',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Icons.more_horiz),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Badge(
            toAnimate: true,
            animationType: BadgeAnimationType.scale,
            shape: BadgeShape.square,
            badgeColor: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(8),
            badgeContent: Text(
              'NEW',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
