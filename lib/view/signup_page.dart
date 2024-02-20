import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/utils/formHelper.dart';
import 'package:first_project/view/library_page.dart';
import 'package:first_project/view/login_page.dart';
import 'package:first_project/controllers/authentication.dart';
import 'package:first_project/utils/uiHelper.dart';
import 'package:first_project/utils/validators.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }

  Future<void> _handleSignUp(email, password) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential? usercredential =
            await Authentication.signUpWithEmailAndPassword(
                email: emailController.text.toString(),
                password: passwordController.text.toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Sign Up',
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
                          validator: Validators.emailValidator,
                          controller: emailController,
                          decoration: customDecoration.customInputDecoration(
                              "Email", Icons.email)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                          validator: Validators.passwordValidator,
                          obscureText: true,
                          controller: passwordController,
                          decoration: customDecoration.customInputDecoration(
                              "Password", Icons.password)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                          validator: Validators.phoneNumberValidator,
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          decoration: customDecoration.customInputDecoration(
                              "Phone Number", Icons.phone)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: UiHelper.CustomButton(() {
                        _handleSignUp(emailController.text.toString(),
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
                  "Already have an Account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      "Or Sign In With",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Authentication().signInWithGoogle(this.context);
                          },
                          iconSize: 30,
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.icecream),
                        )
                      ],
                    )
                  ],
                ))
          ],
        )));
  }
}
