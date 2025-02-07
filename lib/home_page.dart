import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_page.dart';
import 'book_detail.dart';
import 'profile_page.dart';
import 'search_page.dart';
import 'book_provider.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  int _currentIndex = 0; // Track the selected index for bottom navigation

  // Default Colors
  Color appBarColor = Colors.blueGrey;
  Color bottomNavColor = const Color.fromARGB(255, 0, 0, 0);
  Color selectedItemColor = const Color.fromARGB(255, 5, 5, 230);
  Color unselectedItemColor = const Color.fromARGB(255, 0, 0, 0);
  Color cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var bookProvider = Provider.of<BookProvider>(context);

    // List of pages to be shown for each BottomNavigationBarItem
    final List<Widget> _pages = [
      BookListPage(books: bookProvider.books, cartProvider: cartProvider, cardColor: cardColor),
      SearchPage(),
      CartPage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: _currentIndex == 0 
        ? AppBar(
            title: const Text("Ceylon Bookstore"),
            backgroundColor: appBarColor,
          ): null,
      body: _pages[_currentIndex], // Display the appropriate page based on the index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomNavColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the selected tab
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  const BookListPage({
    super.key,
    required this.books,
    required this.cartProvider,
    required this.cardColor,
  });

  final List<Map<String, dynamic>> books;
  final CartProvider cartProvider;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(
                  book: books[index],
                  onAddToCart: (book) => cartProvider.addToCart(book),
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            color: cardColor, // Apply selected card color
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    books[index]["title"]!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "by ${books[index]["author"]}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      books[index]["image"]!,
                      height: 200,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rs: ${books[index]["price"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () => cartProvider.addToCart(books[index]),
                        child: const Text("Add to Cart"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
