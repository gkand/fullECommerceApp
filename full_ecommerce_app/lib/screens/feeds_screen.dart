import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_ecommerce_app/widgets/feeds_product.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds-screen';

  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => FeedsProduct(),
        ),
      ),
    );
  }
}

/**StaggeredGridView.countBuilder(
          itemCount: 30,
          crossAxisCount: 4,
          itemBuilder: (context, index) => FeedsProduct(),
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(2, index.isEven ? 3 : 4),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ), */