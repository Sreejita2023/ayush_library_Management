import 'package:flutter/material.dart';
import 'package:first_project/uiHelper.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final bookController = TextEditingController();
  final authorController = TextEditingController();
  final lenderController = TextEditingController();
  final dateController = TextEditingController();

  static const IconData bookIcon =
      IconData(0xe0ef, fontFamily: 'MaterialIcons');
  static const IconData authorIcon =
      IconData(0xe491, fontFamily: 'MaterialIcons');
  static IconData lenderIcon = IconData(0xf403, fontFamily: 'MaterialIcons');
  static const IconData dateIcon =
      IconData(0xe122, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Book',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
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
                        bookController, "Book Name", bookIcon, false),
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
                        authorController, "Author Name", authorIcon, false),
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
                      "Lender",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: UiHelper.CustomTextField(
                        lenderController, "Lender Name", lenderIcon, false),
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
                          dateController, "Enter Date", dateIcon, false),
                    )
                  ],
                )),



            Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      // signup(emailController.text.toString(),
                      //     passwordController.text.toString());
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
