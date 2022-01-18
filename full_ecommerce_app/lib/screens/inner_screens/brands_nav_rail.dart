import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/screens/inner_screens/brands_nav_rail_widget.dart';

class BrandsNavRailScreen extends StatefulWidget {
  static const routeName = '/brands-nav-rail';
  const BrandsNavRailScreen({Key? key}) : super(key: key);

  @override
  _BrandsNavRailScreenState createState() => _BrandsNavRailScreenState();
}

class _BrandsNavRailScreenState extends State<BrandsNavRailScreen> {
  late String routeArgs;
  late String brands = '';
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    _selectedIndex = int.parse(routeArgs.substring(0, 1));

    if (_selectedIndex == 0) {
      setState(() {
        brands = 'Adidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brands = 'Apple';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brands = 'Dell';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brands = 'H&M';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brands = 'Huawei';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brands = 'Nike';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brands = 'Samsung';
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(
            builder: (ctx, cons) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: cons.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      selectedLabelTextStyle: const TextStyle(
                        letterSpacing: 2.5,
                        fontSize: 25,
                      ),
                      leading: const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://avatars0.githubusercontent.com/u/8186664?s=460&u=f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8f9f8b8d8&v=4",
                          ),
                        ),
                      ),
                      labelType: NavigationRailLabelType.all,
                      destinations: [
                        _buildDestination('Adidas', null),
                        _buildDestination('Apple', null),
                        _buildDestination('Dell', null),
                        _buildDestination('H&M', null),
                        _buildDestination('Huawei', null),
                        _buildDestination('Nike', null),
                        _buildDestination('Samsung', null),
                        _buildDestination('All', null),
                      ],
                      onDestinationSelected: (index) {
                        setState(() {
                          _selectedIndex = index;

                          if (_selectedIndex == 0) {
                            setState(() {
                              brands = 'Adidas';
                            });
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              brands = 'Apple';
                            });
                          }
                          if (_selectedIndex == 2) {
                            setState(() {
                              brands = 'Dell';
                            });
                          }
                          if (_selectedIndex == 3) {
                            setState(() {
                              brands = 'H&M';
                            });
                          }
                          if (_selectedIndex == 4) {
                            setState(() {
                              brands = 'Huawei';
                            });
                          }
                          if (_selectedIndex == 5) {
                            setState(() {
                              brands = 'Nike';
                            });
                          }
                          if (_selectedIndex == 6) {
                            setState(() {
                              brands = 'Samsung';
                            });
                          }
                          if (_selectedIndex == 7) {
                            setState(() {
                              brands = 'All';
                            });
                          }
                        });
                      },
                      selectedIndex: _selectedIndex,
                    ),
                  ),
                ),
              );
            },
          ),
          ContentSpace(
            brand: brands,
          ),
        ],
      ),
    );
  }
}

NavigationRailDestination _buildDestination(String label, IconData? icon) {
  return NavigationRailDestination(
    icon: Icon(icon),
    label: RotatedBox(
      quarterTurns: 3,
      child: Text(label),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  final String brand;

  const ContentSpace({
    Key? key,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, i) {
                    return BrandsNavRailWidget();
                  }),
            ),
          )),
    );
  }
}