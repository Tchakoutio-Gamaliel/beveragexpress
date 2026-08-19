import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beverage_express/pages/splash/splash_screen.dart';
import 'package:beverage_express/pages/onboard/first.dart';
import 'package:beverage_express/pages/onboard/second.dart';
import 'package:beverage_express/pages/onboard/third.dart';
import 'package:beverage_express/pages/auth/login.dart';
import 'package:beverage_express/pages/auth/register.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  bool isLogin = prefs.getBool('isLogin') ?? false;
  runApp(MyApp(
    seenOnboarding: seenOnboarding,
    isLogin: isLogin,));
  }

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  final bool isLogin;
  const MyApp({super.key, required this.seenOnboarding, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beverage Express',
      theme: ThemeData(
        primaryColor:   Color.fromARGB(255, 12, 4, 129),
        useMaterial3: false,
        ),

      initialRoute: '/test',
      
      routes: {
        '/test':(context) =>  SplashScreen(seenOnboarding: seenOnboarding, isLogin: isLogin),
        '/first':(context) => First(),
        '/second':(context) => Second(),
        '/third':(context) => Third(),
        '/login':(context) => Login(),
        '/register':(context) => Register(),
      },

    );
  }
}