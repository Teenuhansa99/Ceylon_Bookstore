import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  List<Map<String, dynamic>> _books = [
    {
      "title": "Rich Dad, Poor Dad",
      "author": "Robert T. Kiyosaki",
      "price": 1250,
      "image": "assets/book1.jpg",
      "description": "Rich Dad Poor Dad is Robert's story of growing up with two dads — his real father and the father of his best friend, his rich dad — and the ways in which both men shaped his thoughts about money and investing."
    },
    {
      "title": "The Alchemist",
      "author": "Paulo Coelho",
      "price": 1000,
      "image": "assets/book2.jpg",
      "description": "Paulo Coelho's masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure. His quest will lead him to riches far different—and far more satisfying—than he ever imagined."
    },
    {
      "title": "Men Are from Mars",
      "author": "John Gray",
      "price": 1500,
      "image": "assets/book3.jpg",
      "description": "The book states that most common relationship problems between men and women are a result of fundamental psychological differences between the sexes"
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

