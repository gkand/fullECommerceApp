import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/models%20&%20providers/product.dart';
import 'package:full_ecommerce_app/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  final FocusNode _node = FocusNode();

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    super.dispose();
  }

  late List<Product> _searchList;

  @override
  Widget build(BuildContext context) {
    final _productData = Provider.of<ProductProvider>(context);
    final _productList = _productData.products();

    return Scaffold(
      bottomSheet: TextField(
        controller: _controller,
        focusNode: _node,
        onChanged: (val) {
          setState(() {
            _searchList = _productData.getBySearch(val);
          });
        },
        minLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: _controller.text.isEmpty
                ? () {}
                : () {
                    _controller.clear();
                    _node.unfocus();
                  },
            icon: Icon(Icons.close,
                color: _controller.text.isNotEmpty ? Colors.red : Colors.grey),
          ),
        ),
      ),
      body: _controller.text.isNotEmpty && _searchList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.search,
                    size: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No result found',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: _controller.text.isNotEmpty
                    ? _searchList.length
                    : _productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: _controller.text.isNotEmpty
                      ? _searchList[index]
                      : _productList[index],
                  child: const FeedsProduct(),
                ),
              ),
            ),
    );
  }
}
