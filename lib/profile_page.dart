import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_page.dart';

class ProfilePage extends StatelessWidget {
  final String _name = "Chandima Teenuhansa Jayathilaka";
  final String _email = "teenuhansa7789@gmail.com";
  final String _shippingAddress = "C 187/4 Welangalla Gatahaththe";
  final String _city = "Avissawella";
  final String _postalCode = "10001";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
        appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromARGB(255, 241, 241, 241), // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpeg'), // Profile Picture
              ),
              const SizedBox(height: 20),
              // User Name
              Text(
                _name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Profile Details
              _buildLabeledBox("Email", _email),
              _buildLabeledBox("Shipping Address", _shippingAddress),
              _buildLabeledBox("City", _city),
              _buildLabeledBox("Postal Code", _postalCode),
              const SizedBox(height: 20),
              // Cart Items Section
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10, bottom: 8),
                child: const Text(
                  "Your Cart Items",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _buildCartItems(cartProvider),
              const SizedBox(height: 20),
              // View Full Cart Button
              if (cartProvider.cartItems.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 97, 84, 218),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      "View Full Cart",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              // Log Out Button
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Log Out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledBox(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Light grey background for boxes
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItems(CartProvider cartProvider) {
    if (cartProvider.cartItems.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Your cart is empty!",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      );
    }

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartProvider.cartItems[index];

          return Container(
            width: 120,
            margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(item["image"], fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    item["title"],
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "Rs. ${item["price"]}",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
