import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  List<Map<String, dynamic>> _books = [
    {
      "title": "Rich Dad, Poor Dad",
      "author": "Robert T. Kiyosaki",
      "price": 1250,
      "image": "assets/book1.jpg",
      "description": "A book about financial literacy and wealth building."
    },
    {
      "title": "The Alchemist",
      "author": "Paulo Coelho",
      "price": 1000,
      "image": "assets/book2.jpg",
      "description": "A journey of self-discovery and chasing dreams."
    },
    {
      "title": "Men Are from Mars",
      "author": "John Gray",
      "price": 1500,
      "image": "assets/book3.jpg",
      "description": "A guide to understanding communication in relationships."
    },
  ];

  List<Map<String, dynamic>> get books => _books;

  void addBook(Map<String, dynamic> newBook) {
    _books.add(newBook);
    notifyListeners(); // Notify widgets when books change
  }

  void updateBookList(List<Map<String, dynamic>> updatedBooks) {
    _books = updatedBooks;
    notifyListeners();
  }
}

