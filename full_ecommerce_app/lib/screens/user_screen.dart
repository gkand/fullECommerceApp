import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/providers/my_theme.dart';
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

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      "https://images.pexels.com/photos/1537875/pexels-photo-1537875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                      fit: BoxFit.cover,
                    ),
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: top < 200 ? 1.0 : 0.0,
                      child: Row(
                        children: const [
                          SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Fluttercraft"),
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
                      _userListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(WishListScreen.routeName);
                        },
                        lIcon: Icons.favorite,
                        color: Colors.redAccent,
                        title: 'Whislist',
                        tIcon: Icons.arrow_forward_ios,
                        tIconCallback: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.shopping_cart,
                        color: Colors.deepPurpleAccent,
                        title: 'Cart',
                        onTap: () {},
                        tIcon: Icons.arrow_forward_ios,
                        tIconCallback: () {},
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
                      // User Information
                      const _userTileHeightSpace(height: 15),
                      const _userTileText(text: 'User Information'),
                      const _userTileHeightSpace(height: 10),
                      _userListTile(
                        lIcon: Icons.email,
                        color: Colors.green,
                        title: 'Email',
                        subTitle: 'Email',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.call,
                        color: Colors.yellow.shade800,
                        title: 'Phone Number',
                        subTitle: 'Number',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.local_shipping,
                        color: Colors.indigo,
                        title: 'Email',
                        subTitle: 'Email',
                        onTap: () {},
                      ),
                      _userListTile(
                        lIcon: Icons.watch_later,
                        color: Colors.redAccent,
                        title: 'Join Date',
                        subTitle: 'date',
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
  final VoidCallback? tIconCallback;
  final VoidCallback? onTap;

  const _userListTile({
    this.subTitle,
    this.tIcon,
    this.tIconCallback,
    this.onTap,
    Key? key,
    required this.lIcon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          lIcon,
          color: color,
        ),
        title: Text(title),
        subtitle: subTitle == null ? null : Text(subTitle!),
        onTap: onTap,
        trailing: IconButton(
          onPressed: tIconCallback,
          icon: Icon(
            tIcon,
          ),
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
