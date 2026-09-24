import 'package:beverage_express/services/cartService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final items = cartservice.items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 4, 129),
        title: const Text('Cart'),
      ),
      body: items.isEmpty ? const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, color: Colors.grey, size: 70,),
            SizedBox(height: 16,),
            Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ) 
      : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return  Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(), 
              children: [
                SlidableAction(onPressed: ((context) {
                  //delete cart item
      
                  setState(() {
                    cartservice.removeItem(item.id);
                  });
                }),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                )
              ]
              ),
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    //product image
                    Image.network(
                      'http://10.124.76.100/beverage-images/${item.image}',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10,),
                     Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            "${item.price} FCFA",
                            style: const TextStyle(
            
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {setState(() {
                                  cartservice.decreaseQuantity(item.id);
                                });
                                }, 
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                "${item.quantity}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartservice.increaseQuantity(item.id);
                                  });
                                }, 
                                icon: const Icon(Icons.add),
                                ),
                            ],
                          )
                        ],
                      ),
                      ),
                    // total for this product
                    Text(
                      "${item.total} FCFA",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                ),
            ),
          );
        }
        ),
      // cart total
      bottomNavigationBar: items.isEmpty ? null
      : Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 12, 4, 129),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
            child: Text(
              "Checkout - ${cartservice.total} FCFA",
            )
            ),
        ),
        ),
    );
  }
}