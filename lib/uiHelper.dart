import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    );
  }

  static CustomButton(VoidCallback voidCallback, String text) {
    return SizedBox(height: 50, width: 200,
        child: ElevatedButton(
          child: Text(
              text, style: TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: () {
            voidCallback();
          }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        )),)
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      },
    );
  }
}
