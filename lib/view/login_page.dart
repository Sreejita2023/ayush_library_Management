import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/utils/formHelper.dart';
import 'package:first_project/view/signup_page.dart';
import 'package:first_project/utils/uiHelper.dart';
import 'package:flutter/material.dart';
import 'package:first_project/view/library_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    login(String email, String password) async {
      print(email);
      if (email == "" && password == "") {
        UiHelper.CustomAlertBox(context, "Enter the required fields");
      } else {
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } catch (ex) {
          return UiHelper.CustomAlertBox(context, ex.toString());
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      // height: 50,
                      margin: const EdgeInsets.only(top: 40),
                      child: TextFormField(
                          controller: emailController,
                          decoration: customDecoration.customInputDecoration(
                              "Email", Icons.email)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: customDecoration.customInputDecoration(
                              "Password", Icons.password)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: UiHelper.CustomButton(() {
                        login(emailController.text.toString(),
                            passwordController.text.toString());
                      }, "Submit"),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do not have an Account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            )
          ],
        )));
  }
}
