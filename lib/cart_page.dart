import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Colors.blueGrey,
      ),
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: Image.asset(cartProvider.cartItems[index]["image"], width: 50),
                    title: Text(cartProvider.cartItems[index]["title"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price: Rs. ${cartProvider.cartItems[index]["price"]}"),
                        Text("Qty: ${cartProvider.cartItems[index]["quantity"]}"),
                        Text("Total: Rs. ${cartProvider.cartItems[index]["price"] * cartProvider.cartItems[index]["quantity"]}"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        cartProvider.removeFromCart(index);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartProvider.cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: Rs. ${cartProvider.totalPrice}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () => cartProvider.clearCart(),
                    child: const Text("Clear Cart"),
                  ),
                ],
              ),
            ),
    );
  }
}
