import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/presentation/screens/email_sign/salom.dart';
import 'package:login_page/presentation/widgets/submit_button.dart';
import 'package:login_page/presentation/widgets/textfiield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordTextController =
        TextEditingController();
    final TextEditingController _userNameTextController =
        TextEditingController();
    final TextEditingController _emailTextController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "SIGN UP",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: [
              reuseableTextFeild(
                  "Email ", Icons.person_outline, false, _emailTextController),
              const SizedBox(
                height: 30,
              ),
              reuseableTextFeild("Password ", Icons.person_outline, false,
                  _passwordTextController),
              const SizedBox(
                height: 30,
              ),
              reuseableTextFeild("Username ", Icons.person_outline, false,
                  _userNameTextController),
              const SizedBox(
                height: 30,
              ),
              signInButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  print("created");
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const Sakon();
                  }))).onError((error, stackTrace) => print(error.toString()));
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
