import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    }, 
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                      )
                      ),
                ],
              ),
              Padding(padding: EdgeInsets.all(1)),
               Center(
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage("assets/images/third.png"),
                      width: 400,
                      height: 380,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 160,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            shape: BoxShape.circle
                          ),
                          child: const Icon(
                            Icons.directions_car,
                            color: Colors.blue,
                          ),
                          ),
                      ),
                    ) 
                  ]
                )
              ),
              Padding(padding: EdgeInsets.all(1)),
              const Text(
                'Fast Delivery',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              const Text(
                'We deliver your drink quickly \n and savely to your doorstep',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(isActive: false),
                  _buildDot(isActive: true),
                  _buildDot(isActive: false),
                ],
              ),
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/third");
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' '),
                        Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    )
                    ),
                ),
                ),
        ],
      ),
    );
  }
}

Widget _buildDot({required bool isActive}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    width: isActive ? 10 : 8,
    height: isActive ? 10 : 8,
    decoration: BoxDecoration(
      color: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
      shape: BoxShape.circle
    ),
  );
}