import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/screens/inner_screens/categories_feed_screen.dart';

// ignore: must_be_immutable
class Category extends StatefulWidget {
  late int index;
  Category({Key? key, required this.index}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, Object>> _categories = [
    {
      'categoryName': 'Phones',
      'categoryImage': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Laptops',
      'categoryImage': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Phones',
      'categoryImage': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImage': 'assets/images/CatClothes.jpeg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImage': 'assets/images/CatShoes.jpeg',
    },
    {
      'categoryName': 'Watches',
      'categoryImage': 'assets/images/CatWatches.jpeg',
    },
    {
      'categoryName': 'Furniture',
      'categoryImage': 'assets/images/CatFurniture.jpeg',
    },
    {
      'categoryName': 'Health',
      'categoryImage': 'assets/images/CatBeauty.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoriesFeedScreen.routeName,
          arguments: _categories[widget.index]['categoryName'],
        );
      },
      child: Container(
        height: 200,
        width: 150,
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
            SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  (_categories[widget.index]['categoryImage'].toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ' ${_categories[widget.index]['categoryName']}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
