import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  late int index;
  Category({Key? key, required this.index}) : super(key: key);

  List<Map<String, Object>> _categories = [
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
    return Container(
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
          Container(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                (_categories[index]['categoryImage'].toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            ' ${_categories[index]['categoryName']}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
