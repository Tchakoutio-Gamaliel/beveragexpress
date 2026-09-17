import 'package:beverage_express/services/apiService.dart';
import '../models/productinfo.dart';
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../services/cartService.dart';

class ProductDetail extends StatefulWidget {
    final int productid;
  const ProductDetail({
    super.key,
    required this.productid,
    });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
     int _qauantity = 1;
     late Future<Productinfo> __productinfoFuture;


    void _incrementQuantity() {
      setState(() {
        _qauantity++;
      });
    }
    
    void _decrementQuantity() {
      setState(() {
        if (_qauantity > 1) {
          _qauantity--;
        }
      });
    }

    @override
    void initState() {
        super.initState();
        __productinfoFuture = Apiservice.getProductInfo(productid: widget.productid);
    }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: __productinfoFuture, 
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(),
                );
            }
            if(snapshot.hasError) {
                return  Text('Error: ${snapshot.error}');
            }
            final product = snapshot.data!;
            return Scaffold(
              body: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                             SizedBox(
                                width: double.infinity,
                                height: 300,
                                child: Image.network(
                                'http://10.124.76.100/beverage-images/${product.image}',
                                errorBuilder: (context, error, StackTrace) {
                                  return const Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  );
                                },
                                fit: BoxFit.cover,
                            ),
                            ),
                            Positioned(
                                bottom: 230,
                                right: 20,
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 12, 4, 129),
                                        borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {}, 
                                          icon: const Icon(Icons.favorite),
                                          iconSize: 25,
                                          color: Colors.red,
                                          ),
                                    ),
                                )
                                ),
                            Positioned(
                                bottom: 230,
                                left: 20,
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 12, 4, 129),
                                        borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          icon: const Icon(Icons.arrow_back_ios),
                                          iconSize: 25,
                                          color: Colors.white,
                                              ),
                                    ),
                                )
                                ),     
                        ],
                      ),
                      
                       Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'Poppins',
                                    ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                    '${product.price.toString()} FCFA',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color:  Color.fromARGB(255, 12, 4, 129),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                                const SizedBox(height: 15,),
                                Text(
                                    product.description,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.grey,
                                    ),
                                ),
                                const SizedBox(height: 16,),
                                const Text(
                                    'Quantity',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 12, 4, 129),
                                        fontSize: 20
                                    ),
                                ),
                                const SizedBox(height: 7,),
                                 Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 12, 4, 129),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                                _decrementQuantity();
                                            }, 
                                            icon: const Icon(Icons.remove),
                                            iconSize: 25,
                                            color: Colors.white,
                                          )
                                        )
                                      ),
                                      const SizedBox(width: 8,),
                                       Text(
                                        _qauantity.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                        ),
                                      ),
                                      const SizedBox(width: 8,),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 12, 4, 129),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                                _incrementQuantity();
                                            }, 
                                            icon: const Icon(Icons.add),
                                            iconSize: 25,
                                            color: Colors.white,
                                          )
                                        )
                                      ),
                                      const SizedBox(width: 10,),
                                      Text(
                                        '= ${_qauantity*product.price} FCFA',
                                        style: const TextStyle(
                                          color: const Color.fromARGB(255, 12, 4, 129),
                                          fontSize: 28,
                                        ),
                                      )
                                    ],
                                )

                            ],
                        ),
                        )
                    ],
                )
                ),
        bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  final item = CartItem(
                    id: product.id, 
                    name: product.name, 
                    image: product.image, 
                    price: product.price, 
                    quantity: _qauantity);

                    cartservice.addItem(item);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added to cart'))
                    );
                }, 
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 4, 129),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
                child:  Text(
                    'Add to cart - ${_qauantity*(product.price)} FCFA',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                ),
                ),
        ),
        ),
            );
        }
      );
     
  }
}