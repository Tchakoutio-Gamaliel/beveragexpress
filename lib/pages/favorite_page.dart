import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // open the favorite box
  final myFavorites = Hive.box('favorite');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 4, 129),
        title: const Text('favourite'),
      ),
      body: ValueListenableBuilder(
        valueListenable: myFavorites.listenable(), 
        builder: (context, box, child) {
            // get all favorite products
            final favorites = myFavorites.values.toList();
      return (favorites.isEmpty) ? 
      const Center(
        child: Text('No favorite added'),
      )
      : GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7
          ),
        itemBuilder: (context, index) {
          final product = favorites[index] as Map;

          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network('http://127.0.0.1:8080/beverage-images/${product['image']}', fit: BoxFit.cover),
                  ),
                const SizedBox(height: 5,),
                Text(product['name']),
                const SizedBox(height: 10,),
                Text(
                  '${product['price']} FCFA'
                )
              ],
            ),
          );
        },
        );
        }
        )
    );
  }
}