 import 'package:beverage_express/pages/products_page.dart';
import 'package:flutter/material.dart';

 class CategoryCard extends StatelessWidget {
    final String name;
    
  const CategoryCard({super.key, required this.name,});

  IconData getCategoryIcon() {
    switch (name) {
        case 'Mineral Water':
        return Icons.water_drop;
        case 'Energy Drinks':
        return Icons.bolt;
        case 'Wine':
        return Icons.wine_bar;
        case 'Spirit':
        return Icons.liquor;
        case 'Beer':
        return Icons.local_bar;
        default:
        return Icons.local_drink_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsPage(categoryname: name,),
            ),
          );
      },
     child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 12),
        child:  Column(
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                ),
                child: Icon(getCategoryIcon(), color: Colors.blue, size: 30,),
            ),
            const SizedBox(height: 8,),
             Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
            )
          ],
        ),
    )
    );
  }
}