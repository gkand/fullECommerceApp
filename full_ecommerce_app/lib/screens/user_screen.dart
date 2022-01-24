// ignore_for_file: camel_case_types

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/cart.dart';
import 'package:full_ecommerce_app/models%20&%20providers/my_theme.dart';
import 'package:full_ecommerce_app/models%20&%20providers/wishlist.dart';
import 'package:full_ecommerce_app/screens/cart_screen.dart';
import 'package:full_ecommerce_app/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user-screen';

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double top = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _uid;
  late String _name = 'Anonymous';
  late String _email = 'Anonymous';
  late String _joinedAt = 'Anonymous';
  late int _phoneNumber = 0;
  String? _imageUrl;
  bool _isLoading = true;

  late ScrollController _scrollController;

  Future<void> _getData() async {
    User? user = await _auth.currentUser;
    _uid = user!.uid;

    if (user.isAnonymous) {
      setState(() {
        _isLoading = false;
      });
      return;
    } else {
      final DocumentSnapshot userDocs =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();
      setState(() {
        _name = user.displayName.toString();
        _email = userDocs.get('email');
        _joinedAt = userDocs.get('joinedDate');
        _phoneNumber = userDocs.get('phoneNumber');
        _imageUrl = userDocs.get('imageUrl');
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    _getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      stretch: true,
                      expandedHeight: 250,
                      flexibleSpace: LayoutBuilder(builder: (ctx, cons) {
                        top = cons.biggest.height;
                        return FlexibleSpaceBar(
                          centerTitle: true,
                          background: Image.network(
                            _imageUrl ??
                                "https://images.pexels.com/photos/1537875/pexels-photo-1537875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                            fit: BoxFit.cover,
                          ),
                          title: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: top < 200 ? 1.0 : 0.0,
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(_imageUrl ??
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text("Fluttercraft"),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: [
                            const _userTileText(text: 'User Bag'),
                            const _userTileHeightSpace(height: 8),

                            Consumer<WishListProvider>(
                              builder: (context, wp, _) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        WishListScreen.routeName,
                                      );
                                    },
                                    leading: Badge(
                                      toAnimate: true,
                                      animationType: BadgeAnimationType.slide,
                                      badgeColor: Colors.indigo,
                                      position:
                                          BadgePosition.topEnd(top: 0, end: 0),
                                      badgeContent: Text(
                                        wp.wishList.length.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    ),
                                    title: const Text('Wishlist'),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                );
                              },
                            ),
                            Consumer<CartProvider>(
                              builder: (context, cp, _) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        CartScreen.routeName,
                                      );
                                    },
                                    leading: Badge(
                                      toAnimate: true,
                                      animationType: BadgeAnimationType.slide,
                                      position:
                                          BadgePosition.topEnd(top: 0, end: 0),
                                      badgeContent: Text(
                                        cp.cartList.length.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      child: const Icon(
                                        Icons.shopping_cart,
                                        size: 40,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                    title: const Text('Cart'),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                );
                              },
                            ),

                            // User Settings
                            const _userTileHeightSpace(height: 15),
                            const _userTileText(text: 'User Settings'),
                            const _userTileHeightSpace(height: 10),
                            Card(
                              child: Consumer<ThemeNotifier>(
                                  builder: (context, notifier, _) {
                                return SwitchListTile.adaptive(
                                  secondary: notifier.isDark
                                      ? Icon(Icons.dark_mode,
                                          color: Colors.amber.shade700)
                                      : Icon(Icons.light_mode,
                                          color: Colors.amber.shade700),
                                  title: notifier.isDark
                                      ? const Text('Dark Mode')
                                      : const Text('Light Mode'),
                                  value: notifier.isDark,
                                  onChanged: (value) {
                                    notifier.toggleTheme(value);
                                  },
                                );
                              }),
                            ),
                            _userListTile(
                              heroTag: 'logout',
                              lIcon: Icons.power_settings_new,
                              color: Colors.red,
                              title: 'Logout',
                              onTap: () async {
                                Navigator.of(context).canPop()
                                    ? Navigator.pop(context)
                                    : null;
                                await _auth.signOut();
                              },
                            ),
                            // User Information
                            const _userTileHeightSpace(height: 15),
                            const _userTileText(text: 'User Information'),
                            const _userTileHeightSpace(height: 10),
                            _userListTile(
                              heroTag: 'email',
                              lIcon: Icons.email,
                              color: Colors.green,
                              title: 'Email',
                              subTitle: _email,
                              onTap: () {},
                            ),
                            _userListTile(
                              heroTag: 'number',
                              lIcon: Icons.call,
                              color: Colors.yellow.shade800,
                              title: 'Phone Number',
                              subTitle: _phoneNumber.toString(),
                              onTap: () {},
                            ),
                            _userListTile(
                              heroTag: 'name',
                              lIcon: Icons.local_shipping,
                              color: Colors.indigo,
                              title: 'Name',
                              subTitle: _name,
                              onTap: () {},
                            ),
                            _userListTile(
                              heroTag: 'date',
                              lIcon: Icons.watch_later,
                              color: Colors.redAccent,
                              title: 'Join Date',
                              subTitle: _joinedAt,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _buildFab()
              ],
            ),
    );
  }

  Widget _buildFab() {
    double defaultMargin = 250;
    double scrollStart = 230;
    double scrollEnd = scrollStart / 2;

    double top = defaultMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offSet = _scrollController.offset;
      top -= offSet;

      if (offSet < defaultMargin - scrollStart) {
        scale = 1.0;
      } else if (offSet < defaultMargin - scrollEnd) {
        scale = (defaultMargin - scrollEnd - offSet) / (scrollEnd);
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 20,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.camera,
          ),
        ),
      ),
    );
  }
}

class _userListTile extends StatelessWidget {
  final IconData lIcon;
  final Color color;
  final String title;
  final String? subTitle;
  final IconData? tIcon;
  final VoidCallback? onTap;
  final String heroTag;

  const _userListTile(
      {this.subTitle,
      this.tIcon,
      this.onTap,
      Key? key,
      required this.lIcon,
      required this.color,
      required this.title,
      required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Card(
        child: ListTile(
          leading: Icon(
            lIcon,
            color: color,
          ),
          title: Text(title),
          subtitle: subTitle == null ? null : Text(subTitle!),
          onTap: onTap ?? () {},
          trailing: tIcon != null
              ? Icon(
                  tIcon,
                )
              : null,
        ),
      ),
    );
  }
}

class _userTileHeightSpace extends StatelessWidget {
  final double height;
  const _userTileHeightSpace({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class _userTileText extends StatelessWidget {
  final String text;
  const _userTileText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' $text',
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
