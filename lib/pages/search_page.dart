import 'package:beverage_express/services/apiService.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   Future<List<Product>>? _searchFuture;
  final  _searchController = TextEditingController();

  void searchProducts() {
    print("started");
    final search = _searchController.text.trim();

    if (search.isEmpty) {
      return;
    }

    setState(() {
      _searchFuture = Apiservice.searchProducts(search: search);
    });
    print("stop");
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 4, 129),
        title: const Text('Search'),
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(60), 
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextFormField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) {
                searchProducts();
              },
              decoration: InputDecoration(
                hintText: "search beverage",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            )
          ),
      ),
      body: _searchFuture == null ? const Center(child: Text('Search for a beverage'),) : 
      FutureBuilder(
        future: _searchFuture, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('"Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('No products found'),
            );
          }

          final products = snapshot.data!;
          
          return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ), 
              itemBuilder: (context, index) {
                print(products[index].name);
                return ProductCard(name: products[index].name, price: products[index].price, id: products[index].id, image: "http://10.124.76.100/beverage-images/${products[index].image}");
              }
            );
          
        }
        ),
    );
  }
}