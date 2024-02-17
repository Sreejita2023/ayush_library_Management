import 'package:first_project/service/databse.dart';
import 'package:flutter/material.dart';
import 'package:first_project/uiHelper.dart';
import 'package:random_string/random_string.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController bookController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController lenderController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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
                    onPressed: () async {
                      String Id = randomAlphaNumeric(10);
                      print('id $Id');
                      print('book ${bookController.text}');
                      print('author ${authorController.text}');
                      print('date ${dateController.text}');
                      print('lender ${lenderController.text}');

                      Map<String, dynamic> bookInfoMap = {
                        "Book": bookController.text.toString(),
                        "Id": Id,
                        "Author": authorController.text.toString(),
                        "Lender": lenderController.text.toString(),
                        "Date": dateController.text.toString(),
                      };

                      await DatabaseMethods()
                          .addBookDetails(bookInfoMap, Id)
                          .then((value) {
                        print('uploaded succesfully');
                        // Fluttertoast.showToast(
                        //     msg: "Book Details Added Successfully",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.CENTER,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.red,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);
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
