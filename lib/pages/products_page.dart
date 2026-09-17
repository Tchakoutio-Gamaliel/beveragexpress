import 'package:flutter/material.dart';
import '../services/apiService.dart';
import '../widgets/product_card.dart';
import 'package:beverage_express/models/product.dart';

class ProductsPage extends StatelessWidget {
  final String categoryname;
  const ProductsPage({
    super.key,
    required this.categoryname
    });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 4, 129),
        elevation: 0,
        title: Text(
        categoryname,
        style: const TextStyle(
          color:  Colors.white,
        ),
        ),
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const SizedBox(height: 15,),
                 FutureBuilder <List<Product>>(
                  future: Apiservice.getProductsByCategory(categoryname: categoryname), 
                  builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return  Text('Error: ${snapshot.error}');
                      }
                      
                      final products = snapshot.data ?? [];
                      if (products.isEmpty) {
                        return const  Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 70,
                                color: Colors.grey,
                                ),
                                SizedBox(height: 15,),
                               Text(
                              'No product in this category',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ],
                          )
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                          ), 
                        itemBuilder: (context, index) {
                          return ProductCard(name: products[index].name, price: products[index].price, id: products[index].id, image: "http://10.124.76.100/beverage-images/${products[index].image}");
                        }
                        );
                  }
                  )

              ],
            ),
            ),
        ),
    );
  }
}