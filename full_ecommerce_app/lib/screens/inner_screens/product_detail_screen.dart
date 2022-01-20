// ignore_for_file: camel_case_types

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/wishlist_screen.dart';
import 'package:full_ecommerce_app/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail-screen';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final _productProvider = Provider.of<ProductProvider>(context);
    List<Product> _products = _productProvider.products();
    final _cartProvider = Provider.of<CartProvider>(context);

    final _product = _productProvider.getById(productId);
    final _whisListProvider = Provider.of<WishListProvider>(context);

    return Scaffold(
      bottomSheet: _bottomSheet(
        cartProvider: _cartProvider,
        product: _product,
        productId: productId,
        wishListProvider: _whisListProvider,
      ),
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        actions: [
          Consumer<WishListProvider>(
            builder: (context, wp, _) {
              return Badge(
                toAnimate: true,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(wp.wishList.length.toString()),
                child: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishListScreen.routeName);
                  },
                ),
              );
            },
          ),
          Consumer<CartProvider>(
            builder: (context, cp, _) {
              return Badge(
                toAnimate: true,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(cp.cartList.length.toString()),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              _product.imageUrl,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 300),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.save),
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                ' ${_product.title}',
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '\$ ${_product.price}',
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          ' ${_product.description}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _contentRow(
                        title: 'Brand',
                        nameTitle: ' ${_product.brand}',
                      ),
                      _contentRow(
                        title: 'Quantity',
                        nameTitle: ' ${_product.quantity}',
                      ),
                      _contentRow(
                        title: 'Category',
                        nameTitle: ' ${_product.productCategoryName}',
                      ),
                      _contentRow(
                        title: 'Popularity',
                        nameTitle: _product.isPopular ? ' Popular' : ' Barely',
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                      Container(
                        color: Colors.black54,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'No review yet',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Be the first to review this product',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 70),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Suggested Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 200,
                          child: ChangeNotifierProvider.value(
                            value: _products[index],
                            child: const FeedsProduct(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _contentRow extends StatelessWidget {
  final String title;
  final String nameTitle;
  const _contentRow({
    Key? key,
    required this.nameTitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            nameTitle,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  final String productId;
  final Product product;
  final CartProvider cartProvider;
  final WishListProvider wishListProvider;

  const _bottomSheet(
      {Key? key,
      required this.productId,
      required this.product,
      required this.cartProvider,
      required this.wishListProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.pinkAccent,
            height: 50,
            child: Center(
              child: TextButton(
                onPressed: cartProvider.cartList.containsKey(productId)
                    ? () {}
                    : () {
                        cartProvider.addToCart(
                          productId,
                          product.title,
                          product.imageUrl,
                          product.price,
                        );
                      },
                child: Text(
                  cartProvider.cartList.containsKey(productId)
                      ? 'IN CART'
                      : 'ADD TO CART',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'BUY NOW',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 50,
            child: Center(
                child: IconButton(
              icon: wishListProvider.wishList.containsKey(productId)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
              onPressed: () {
                wishListProvider.addOrRemoveWishList(
                    productId, product.title, product.imageUrl, product.price);
              },
            )),
          ),
        ),
      ],
    );
  }
}
