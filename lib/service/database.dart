import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addBookDetails(
      Map<String, dynamic> bookInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Book")
          .doc(id)
          .set(bookInfoMap);
    } catch (e) {
      print("Error adding book details: $e");
    }
  }

  Future<Stream<QuerySnapshot>> getBookDetails() async {
    return FirebaseFirestore.instance.collection("Book").snapshots();
  }

  Future<void> updateBookDetail(
      String id, Map<String, dynamic> updateInfo) async {
    try {
      await FirebaseFirestore.instance
          .collection("Book")
          .doc(id)
          .update(updateInfo);
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
}
