import 'package:flutter/material.dart';
import 'cart_page.dart';

class BookDetailPage extends StatelessWidget {
  final Map<String, dynamic> book;
  final Function(Map<String, dynamic>) onAddToCart;

  const BookDetailPage({super.key, required this.book, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book["title"]),
        backgroundColor: const Color(0xFF607D8B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  book["title"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "by ${book["author"]}",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 15),
                Image.asset(
                  book["image"],
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),
                Text(
                  "Rs. ${book["price"]}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    onAddToCart(book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to Cart!")),
                    );
                  },
                  child: const Text("Add to Cart"),
                ),
                const SizedBox(height: 15),
                Text(
                  book["description"] ?? "No description available.",
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
