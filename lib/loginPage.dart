// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_project/signupPage.dart';
// import 'package:first_project/uiHelper.dart';
import 'package:first_project/signupPage.dart';
import 'package:flutter/material.dart';

//
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const IconData email_icon = IconData(0xee35, fontFamily: 'MaterialIcons');
    const IconData password_icon =
    IconData(0xe47a, fontFamily: 'MaterialIcons');
    const IconData phone_icon = IconData(0xe4a2, fontFamily: 'MaterialIcons');

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    signup(String email, String password) {
      print(email);
      // if (email == "" && password == "") {
      //   UiHelper.CustomAlertBox(context, "Enter the required fields")
      // } else {
      //   UserCredential? usercredential;
      //
      //   try {
      //     usercredential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //         email: email, password: password);
      //     Navigator.push(context, route)
      //   }
      //   on FirebaseAuthException catch (exex) {
      //     return UiHelper.CustomAlertBox(context, ex.code.toString());
      //   }
      // }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('New Login'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/img.png',
                  height: 100,
                ),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 40),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(email_icon),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 2))),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(password_icon),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    width: 150,
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue), // Set the background color to blue
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have an Account?",
                      style: TextStyle(fontSize: 16),),
                    TextButton(onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>SignUpPage()));
                    },
                        child: Text("Sign Up", style: TextStyle(fontSize: 20),))
                  ],
                )
              ],
            )));
  }
}
