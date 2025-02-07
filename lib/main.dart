import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart'; // Import BookList widget
import 'cart_provider.dart'; // Import CartProvider
import 'book_provider.dart'; // Import BookProvider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),  // Cart state management
        ChangeNotifierProvider(create: (_) => BookProvider()), // Book state management
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ceylon Bookstore',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BookList(), // Directly show BookList without an extra AppBar
    );
  }
}
