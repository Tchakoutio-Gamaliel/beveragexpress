import 'package:beverage_express/models/product.dart';
import 'package:flutter/material.dart';
import 'package:beverage_express/widgets/category_card.dart';
import '../models/category.dart';
import '../services/apiService.dart';
import '../widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 4, 129),
        elevation: 0,
        title: RichText(
                text: const TextSpan(
                  text: 'Beverage',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Express',
                      style: TextStyle(
                        fontSize: 24,
                        color:  Color.fromARGB(255, 255, 136, 0),
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ]
                ),
                ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_rounded)),
          const SizedBox(width: 8,)
        ],
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(60), 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Beverage',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            )
          ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/images/background1.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Color.fromARGB(255, 8, 0, 255), BlendMode.darken),
                  ),
                  
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child:  Padding(
                  padding: const  EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Center(
                        child: Text('Welcome back Gamaliel', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                      const SizedBox(height: 8,),
                      const Text('What would you like to order today?', style: TextStyle(fontSize: 20, color: Colors.white),),
                      const SizedBox(height: 8,),
                      SizedBox(
                        width: 160,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {}, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text('Order Now', style: TextStyle(color: Color.fromARGB(255, 12, 4, 129), fontSize: 16),),
                             Icon(Icons.arrow_forward, color: Color.fromARGB(255, 12, 4, 129),),
                            ],
                            )
                          ),
                      )
                    ],
                  )
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Categories',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 4, 129),
                  ),
                ),

                const SizedBox(height: 15,), 
 
                 // Categories of product display part

                FutureBuilder <List<Category>>(
                  future: Apiservice.getCategories(), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    final categories = snapshot.data ?? [];
                    return SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                         return CategoryCard(name: categories[index].name,);
                        }
                        ),
                    );
                  }
                  ),

                  const SizedBox(height: 15,),

                const Text(
                  'Popular Products',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 4, 129),
                  ),
                ),

                const SizedBox(height: 15,),

                // Popular products display part
        
                  FutureBuilder <List<Product>> (
                    future: Apiservice.getPopullarProduts(), 
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
                          return ProductCard(name: products[index].name, price: products[index].price, id: products[index].id, image: "http://172.24.126.184/beverage-images/${products[index].image}");
                        }
                        );
                    }
                    ),
            ],
          ),
          ),
      ),
      
    );
  }
}