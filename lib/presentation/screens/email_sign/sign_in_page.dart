import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/presentation/screens/email_sign/salom.dart';
import 'package:login_page/presentation/widgets/submit_button.dart';
import 'package:login_page/presentation/widgets/textfiield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 23, 45),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reuseableTextFeild(
                "Username ", Icons.person_outline, false, _emailTextController),
            const SizedBox(
              height: 30,
            ),
            reuseableTextFeild(
                "Password", Icons.lock_outline, false, _passwordTextController),
            const SizedBox(
              height: 40,
            ),
            signInButton(context, true, () async {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text.trim(),
                      password: _passwordTextController.text.trim())
                  .then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const Sakon();
                      }))));
            })
          ],
        ),
      ),
    );
  }
}
