import 'package:backdrop/backdrop.dart';
import 'package:badges/badges.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/screens/feeds_screen.dart';
import 'package:full_ecommerce_app/screens/inner_screens/brands_nav_rail.dart';
import 'package:full_ecommerce_app/screens/wishlist_screen.dart';
import 'package:full_ecommerce_app/widgets/back_layer.dart';
import 'package:full_ecommerce_app/widgets/category.dart';
import 'package:full_ecommerce_app/widgets/popular_products.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _carouselImages = [
    Image.asset('assets/images/carousel1.png'),
    Image.asset('assets/images/carousel2.jpeg'),
    Image.asset('assets/images/carousel3.jpeg'),
    Image.asset('assets/images/carousel4.png'),
  ];

  final List _swiperImages = [
    'assets/images/adidas.jpeg',
    'assets/images/apple.jpeg',
    'assets/images/Dell.jpeg',
    'assets/images/h&m.jpeg',
    'assets/images/Huawei.jpeg',
    'assets/images/nike.jpeg',
    'assets/images/samsung.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final popularProducts = productData.popularProducts;

    return Scaffold(
      body: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height * 0.4,
        appBar: BackdropAppBar(
          title: const Text("Flutter Shop"),
          leading: const BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
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
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                    "https://avatars0.githubusercontent.com/u/8186664?s=460&u=f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8&v=4",
                  ),
                ),
              ),
            ),
          ],
        ),
        stickyFrontLayer: true,
        backLayer: const BackLayer(),
        frontLayer: ListView(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Carousel(
                images: _carouselImages,
                indicatorBgPadding: 7,
                dotSize: 5,
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Category(
                        index: index,
                      ),
                      const SizedBox(width: 8),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Brands',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            BrandsNavRailScreen.routeName,
                            arguments: 7);
                      },
                      child: const Text('View All'))
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Swiper(
                onTap: (index) {
                  Navigator.of(context).pushNamed(BrandsNavRailScreen.routeName,
                      arguments: index);
                },
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: _swiperImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      _swiperImages[index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(FeedsScreen.routeName,
                            arguments: 'popular');
                      },
                      child: const Text('View All'))
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: popularProducts[index],
                    child: const PopularProducts(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
