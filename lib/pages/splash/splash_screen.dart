
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final bool seenOnboarding;
  final bool isLogin;
  const SplashScreen({super.key, required this.seenOnboarding, required this.isLogin});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  void navigateUser() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (widget.seenOnboarding == false) {
      Navigator.pushReplacementNamed(context, '/first');
    }
    else if (widget.isLogin == false) {
      Navigator.pushReplacementNamed(context, '/login');
    }
    else{
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/first.png"),
              width: 200,
              height: 250,
              fit: BoxFit.cover,
              ),
              const Padding(padding: EdgeInsets.all(1)),
              RichText(
                text: const TextSpan(
                  text: 'Beverage',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 3, 64, 114),
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
                Padding(padding: EdgeInsets.all(5)),
                const Text(
                  'Your favorite drinks, delivered fast',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  )
          ],
          ),
        ),
    );
  }
}