import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addBookDetails(Map<String, dynamic> bookInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Book")
          .doc(id)
          .set(bookInfoMap);
    } catch (e) {
      print("Error adding book details: $e");
    }
  }
}
