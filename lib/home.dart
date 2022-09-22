import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: _logout,
                child: Text("Logout"),
              ),
            )
          ],
        )),
      ),
    );
  }
}
