import 'package:first_project/view/create_book_page.dart';
import 'package:first_project/controllers/crud_controller.dart';
import 'package:first_project/utils/uiHelper.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/book_model.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  TextEditingController bookController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController borrowerController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future _popup(String id) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            child: ListView(
              shrinkWrap: true,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  'Edit',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                Text(
                  'Details',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  // Set the top margin as needed
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          "Book",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: UiHelper.CustomTextField(
                            bookController, "Book Name", Icons.book, false),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  // Set the top margin as needed
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          "Author",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: UiHelper.CustomTextField(
                            authorController, "Author Name", Icons.book, false),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  // Set the top margin as needed
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          "Borrower",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: UiHelper.CustomTextField(
                            borrowerController, "Borrower Name", Icons.person, false),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  // Set the top margin as needed
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          "Issued on",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: UiHelper.CustomTextField(
                            dateController, "Enter Date", Icons.calendar_month, false),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: UiHelper.CustomButton(() {
                  _handleUpdateBook(id);
                }, 'Update'))
              ],
            ),
          ),
        ),
      );

  Future<void> _handleUpdateBook(id) async {
    try {
      await DatabaseMethods()
          .updateBookDetail(
              title: bookController.text.toString(),
              id: id,
              author: authorController.text.toString(),
              borrower: borrowerController.text.toString(),
              date: dateController.text.toString())
          .then((value) => Navigator.pop(context));
      setState(() {});
    } catch (e) {
      return UiHelper.CustomAlertBox(context, "Error occurred while updating book");
    }
  }

  Future<void> _handleDeleteBook(id) async {
    try {
      DatabaseMethods().deleteBookDetail(id);
      setState(() {});
    } catch (e) {
      return UiHelper.CustomAlertBox(context, "Error occurred while deleting book");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateBook()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title:
            Text('Library Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(child: _buildBookDetailsList2()),
          ],
        ),
      ),
    );
  }

  Widget _buildBookDetailsList2() {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: DatabaseMethods().getBookDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Book>? books = snapshot.data;

              if (books == null || books.isEmpty) {
                return Text('No books Found');
              } else {
                return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return _booKTile(books[index]);
                    });
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong!'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _booKTile(Book book) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book: ${book.title}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Author: ${book.author}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      bookController.text = book.title;
                      authorController.text = book.author;
                      borrowerController.text = book.borrower;
                      dateController.text = book.date;
                      _popup(book.id);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  IconButton(
                    onPressed: () {
                      _handleDeleteBook(book.id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Text(
                "Borrower: ${book.borrower}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Date: ${book.date}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
