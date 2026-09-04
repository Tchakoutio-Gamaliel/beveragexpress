import 'package:flutter/material.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                )
            ],
          ),
          ),
      ),
      
    );
  }
}