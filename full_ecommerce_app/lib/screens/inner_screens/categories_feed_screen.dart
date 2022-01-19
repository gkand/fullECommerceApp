import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class CategoriesFeedScreen extends StatelessWidget {
  static const routeName = '/categories-feeds-screen';

  const CategoriesFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catName = ModalRoute.of(context)!.settings.arguments as String;

    final productProvider = Provider.of<ProductProvider>(context);
    List<Product> _products = productProvider.getByCatName(catName);

    return Scaffold(
      appBar: AppBar(
        title: Text(catName.toString()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: _products[index],
            child: const FeedsProduct(),
          ),
        ),
      ),
    );
  }
}
