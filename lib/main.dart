import 'package:dressed/favourite.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'nav_bar_screen.dart';
import 'first_page.dart';
import 'login_page.dart';
import 'register-page.dart';
import 'home.dart';
import 'cart_provider.dart';
import 'favourite_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),// ✅ Fixed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dressed',
        home: const FirstPage(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const BottomNavBar(),

        },
      ),
    );
  }
}
