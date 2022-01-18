import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class FeedsProduct extends StatefulWidget {
  const FeedsProduct({Key? key}) : super(key: key);

  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    "https://images.pexels.com/photos/2066896/pexels-photo-2066896.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Description',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$ 299.00',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantoity 12 left',
                      maxLines: 1,
                      style: TextStyle(
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
          badgeContent: Text('NEW', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
