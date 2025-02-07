import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_detail.dart';
import 'book_provider.dart'; // Import BookProvider

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterBooks);
  }

  void _filterBooks() {
    String query = _searchController.text.toLowerCase();
    var books = Provider.of<BookProvider>(context, listen: false).books;
    setState(() {
      filteredBooks = books
          .where((book) => book["title"].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var books = Provider.of<BookProvider>(context).books;
    if (_searchController.text.isEmpty) {
      filteredBooks = books; // Show all books when search is empty
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Books"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search by Title",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    filteredBooks[index]["image"],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(filteredBooks[index]["title"]),
                  subtitle: Text("by ${filteredBooks[index]["author"]}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          book: filteredBooks[index],
                          onAddToCart: (book) {},
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
