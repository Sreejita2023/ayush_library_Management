import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/book_model.dart';

class DatabaseMethods {
  Future<void> addBookDetails(
      {required title, required id, required author, required borrower, required date}) async {
    Book newBook = Book(title: title, id: id, author: author, borrower: borrower, date: date);
    try {
      await FirebaseFirestore.instance.collection("Book").doc(id).set(newBook.toJson());
    } catch (error) {
      throw "Error adding book details";
    }
  }

  Future<List<Book>> getBookDetails() async {
    try {
      var collectionSnapshot = await FirebaseFirestore.instance.collection("Book").get();
      List<Book> books = collectionSnapshot.docs.map((doc) => Book.fromJson(doc.data())).toList();
      return books;
    } catch (error) {
      throw "Error fetching book details";
    }
  }

  Future<void> updateBookDetail(String id, Map<String, dynamic> updateInfo) async {
    try {
      await FirebaseFirestore.instance.collection("Book").doc(id).update(updateInfo);
    } catch (error) {
      throw "Error updating book details";
    }
  }

  Future<void> deleteBookDetail(String id) async {
    try {
      await FirebaseFirestore.instance.collection("Book").doc(id).delete();
    } catch (error) {
      throw "Error deleting book details";
    }
  }
}
