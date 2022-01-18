import 'package:flutter/material.dart';

class FullWishListWidget extends StatefulWidget {
  const FullWishListWidget({Key? key}) : super(key: key);

  @override
  State<FullWishListWidget> createState() => _FullWishListWidgetState();
}

class _FullWishListWidgetState extends State<FullWishListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.pexels.com/photos/3210711/pexels-photo-3210711.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
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
                      const Flexible(
                        child: Text(
                          'Monitor 2',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {},
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
                    children: const [
                      Text(
                        'Price : ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '\$ 450.00',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Flexible(
                    child: Text(
                      'Description : ',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
