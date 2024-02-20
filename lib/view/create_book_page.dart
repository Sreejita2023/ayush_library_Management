import 'package:first_project/controllers/database.dart';
import 'package:flutter/material.dart';
import 'package:first_project/utils/uiHelper.dart';
import 'package:random_string/random_string.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController bookController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController borrowerController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Book Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20), // Set the top margin as needed
              child: Row(
                children: [
                  Container(
                    width: 80,
                    child: Text(
                      "Book Name",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: UiHelper.CustomTextField(
                        bookController, "Book Name", Icons.book, false),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20), // Set the top margin as needed
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
                    width: 250,
                    child: UiHelper.CustomTextField(
                        authorController, "Author Name", Icons.person, false),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20), // Set the top margin as needed
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

                    width: 250,
                    child: UiHelper.CustomTextField(
                        borrowerController, "Borrower", Icons.person_2, false),
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
                      width: 250,
                      child: UiHelper.CustomTextField(
                          dateController, "Enter Date", Icons.calendar_month, false),
                    )
                  ],
                )),
            Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      String Id = randomAlphaNumeric(10);

                      Map<String, dynamic> bookInfoMap = {
                        "Book": bookController.text.toString(),
                        "Id": Id,
                        "Author": authorController.text.toString(),
                        "Borrower": borrowerController.text.toString(),
                        "Date": dateController.text.toString(),
                      };

                      await DatabaseMethods()
                          .addBookDetails(bookInfoMap, Id)
                          .then((value) {
                        print('uploaded successfully');
                        Fluttertoast.showToast(
                            msg: "Book Details Added Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue), // Set the background color to blue
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        ),
      ),
    );
  }
}
