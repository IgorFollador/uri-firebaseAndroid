import 'package:firebase_android/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  _validateFields() {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (password.isNotEmpty && password.length >= 6) {
        _loginUser(email, password);
      }
    }
  }

  _loginUser(email, password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              setState(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }),
            });
  }

  _validateLogin() {
    User? userLogged = FirebaseAuth.instance.currentUser;
    if (userLogged != null) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _validateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _controllerPassword,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                ),
                ElevatedButton(onPressed: _validateFields, child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
