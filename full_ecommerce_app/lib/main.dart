import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/providers/my_theme.dart';
import 'package:full_ecommerce_app/screens/bottom_nav_screen.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/feeds_screen.dart';
import 'package:full_ecommerce_app/screens/home_screen.dart';
import 'package:full_ecommerce_app/screens/search_screen.dart';
import 'package:full_ecommerce_app/screens/user_screen.dart';
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
          },
        );
      }),
    );
  }
}
