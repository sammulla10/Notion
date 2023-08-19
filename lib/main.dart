import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notion_app/screens/cart_screen.dart';
import 'package:notion_app/screens/main_screen.dart';
import 'package:notion_app/screens/splash_screen.dart';
import 'package:notion_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notion Assignment',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 148)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.main: (context) => const MainScreen(),
        Routes.cart: (context) => const CartScreen(),
      },
    );
  }
}
