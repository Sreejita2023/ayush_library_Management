import 'package:first_project/view/book_page.dart';
import 'package:first_project/service/database.dart';
import 'package:first_project/utils/uiHelper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController bookController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController borrowerController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  static const IconData bookIcon =
      IconData(0xe0ef, fontFamily: 'MaterialIcons');
  static const IconData authorIcon =
      IconData(0xe491, fontFamily: 'MaterialIcons');
  static IconData borrowerIcon = IconData(0xf403, fontFamily: 'MaterialIcons');
  static const IconData dateIcon =
      IconData(0xe122, fontFamily: 'MaterialIcons');
  Stream? _bookStream;

  void _getBookDetailsOnLoad() async {
    _bookStream = await DatabaseMethods().getBookDetails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getBookDetailsOnLoad();
  }

  Widget _buildBookDetailsList() {
    return StreamBuilder(
      stream: _bookStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];

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
                          "Book: ${ds["Book"]}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Author: ${ds["Author"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                bookController.text = ds["Book"];
                                authorController.text = ds["Author"];
                                borrowerController.text = ds["Borrower"];
                                dateController.text = ds["Date"];
                                EditBookDetail(ds["Id"]);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                DatabaseMethods().deleteBookDetail(ds["Id"]);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Borrower: ${ds["Borrower"]}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Date: ${ds["Date"]}",
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
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Book()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Library Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(child: _buildBookDetailsList()),
          ],
        ),
      ),
    );
  }

  Future EditBookDetail(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel)),
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
                              bookController, "Book Name", bookIcon, false),
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
                          child: UiHelper.CustomTextField(authorController,
                              "Author Name", authorIcon, false),
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
                          child: UiHelper.CustomTextField(borrowerController,
                              "Borrower Name", borrowerIcon, false),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: UiHelper.CustomTextField(
                                dateController, "Enter Date", dateIcon, false),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> updateInfo = {
                          "Book": bookController.text.toString(),
                          "Id": id,
                          "Author": authorController.text.toString(),
                          "Borrower": borrowerController.text.toString(),
                          "Date": dateController.text.toString(),
                        };
                        await DatabaseMethods()
                            .updateBookDetail(id, updateInfo)
                            .then((value) => Navigator.pop(context));
                      },
                      child: Text('Update'),
                    ),
                  )
                ],
              ),
            ),
          ));
}
