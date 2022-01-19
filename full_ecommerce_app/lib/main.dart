import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/models%20&%20providers/my_theme.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/screens/bottom_nav_screen.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/feeds_screen.dart';
import 'package:full_ecommerce_app/screens/home_screen.dart';
import 'package:full_ecommerce_app/screens/inner_screens/brands_nav_rail.dart';
import 'package:full_ecommerce_app/screens/inner_screens/categories_feed_screen.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';
import 'package:full_ecommerce_app/screens/search_screen.dart';
import 'package:full_ecommerce_app/screens/user_screen.dart';
import 'package:full_ecommerce_app/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeNotifier()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
        return MaterialApp(
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          debugShowCheckedModeBanner: false,
          home: const BottomNavScreen(),
          routes: {
            BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            FeedsScreen.routeName: (ctx) => const FeedsScreen(),
            SearchScreen.routeName: (ctx) => const SearchScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            UserScreen.routeName: (ctx) => const UserScreen(),
            BrandsNavRailScreen.routeName: (ctx) => const BrandsNavRailScreen(),
            WishListScreen.routeName: (ctx) => const WishListScreen(),
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CategoriesFeedScreen.routeName: (ctx) =>
                const CategoriesFeedScreen(),
          },
        );
      }),
    );
  }
}
