import 'package:flutter/material.dart';
import 'screens/first_page.dart';
import 'screens/register_page.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
                title: 'Dressed',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                primarySwatch: Colors.indigo,
                fontFamily: 'Roboto',
      ),
        initialRoute: '/',
                routes: {
            '/': (context) => const FirstPage(),
                    '/register': (context) => const RegisterPage(),
        },
    );
    }
}
