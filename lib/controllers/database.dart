import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/book_model.dart';

class DatabaseMethods {

  Future<void> addBookDetails2({title, id, author, borrower, date}) async {
    Book newBook = Book(title: title, id: id, author: author, borrower: borrower, date: date);
    try {
      await FirebaseFirestore.instance.collection("Book")
          .doc(id).
      set(newBook.toJson());
    } catch (e) {
      print("Error adding book details: $e");
    }
  }

  Future<Stream<QuerySnapshot>> getBookDetails() async {
    return FirebaseFirestore.instance.collection("Book").snapshots();
  }

  Future<void> updateBookDetail(String id, Map<String, dynamic> updateInfo) async {
    try {
      await FirebaseFirestore.instance.collection("Book").doc(id).update(updateInfo);
    } catch (e) {
      print("Error updating book details: $e");
    }
  }

  Future<void> deleteBookDetail(String id) async {
    try {
      await FirebaseFirestore.instance.collection("Book").doc(id).delete();
    } catch (e) {
      print("Error updating book details: $e");
    }
  }

  Future<List<Book>> fetchAnimals() async {
    var collectionSnapshot = await FirebaseFirestore.instance.collection("Book").get();
    final books = collectionSnapshot.docs.map((doc) => Book.fromJson(doc.data())).toList();
    return books;
  }
}
