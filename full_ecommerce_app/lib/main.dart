import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/models%20&%20providers/my_theme.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/screens/auth/auth_stream.dart';
import 'package:full_ecommerce_app/screens/auth/login_screen.dart';
import 'package:full_ecommerce_app/screens/auth/signup_screen.dart';
import 'package:full_ecommerce_app/screens/bottom_nav_screen.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/feeds_screen.dart';
import 'package:full_ecommerce_app/screens/home_screen.dart';
import 'package:full_ecommerce_app/screens/inner_screens/brands_nav_rail.dart';
import 'package:full_ecommerce_app/screens/inner_screens/categories_feed_screen.dart';
import 'package:full_ecommerce_app/screens/inner_screens/product_detail_screen.dart';
import 'package:full_ecommerce_app/screens/landing_screen.dart';
import 'package:full_ecommerce_app/screens/main_screen.dart';
import 'package:full_ecommerce_app/screens/search_screen.dart';
import 'package:full_ecommerce_app/screens/upload_product_screen.dart';
import 'package:full_ecommerce_app/screens/user_screen.dart';
import 'package:full_ecommerce_app/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
        ChangeNotifierProvider(create: (ctx) => WishListProvider()),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
        return MaterialApp(
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          debugShowCheckedModeBanner: false,
          home: const AuthStateScreen(),
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
            LandingScreen.routeName: (ctx) => const LandingScreen(),
            LoginScreen.routeName: (ctx) => const LoginScreen(),
            SignupScreen.routeName: (ctx) => const SignupScreen(),
            UploadProductScreen.routeName: (ctx) => const UploadProductScreen(),
          },
        );
      }),
    );
  }
}
