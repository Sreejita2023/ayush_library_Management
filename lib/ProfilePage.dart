import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            'Ayush Jaiswal',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
