import 'package:beverage_express/pages/myAddresses_page.dart';
import 'package:beverage_express/pages/myOrders_page.dart';
import 'package:beverage_express/pages/notification_page.dart';
import 'package:beverage_express/pages/profile_page.dart';
import 'package:beverage_express/pages/setting_page.dart';
import 'package:beverage_express/services/cartService.dart';
import 'package:beverage_express/services/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beverage_express/pages/splash/splash_screen.dart';
import 'package:beverage_express/pages/onboard/first.dart';
import 'package:beverage_express/pages/onboard/second.dart';
import 'package:beverage_express/pages/onboard/third.dart';
import 'package:beverage_express/pages/auth/login.dart';
import 'package:beverage_express/pages/auth/register.dart';
import 'package:beverage_express/pages/firs_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialise hive
  await Hive.initFlutter();
  // open the box
  await Hive.openBox('favorite');
  await cartservice.loadCart();
  await loadCartCount();
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
        primarySwatch:   Colors.blue,
        fontFamily: 'inter',
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
        '/firstPage':(context) => FirstPages(),
        '/ProfilePage':(context) => ProfilePage(),
        '/notificationpage':(context) => NotificationPage(),
        '/settingpage':(context) => SettingPage(),
        '/myaddressespage':(context) => MyaddressesPage(),
        '/myorderspage':(context) => MyordersPage(),
      },

    );
  }
}