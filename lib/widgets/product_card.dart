import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  final int id;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.id,
    required this .image,
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 160,
      
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Image.network(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, StackTrace) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 50,
                );
              },
            ),
          ),
           Padding(
            padding:  EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "$price FCFA",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 4, 129),
                  ),
                )
              ],
            ),
            )
        ],
      ),
    );
  }
}