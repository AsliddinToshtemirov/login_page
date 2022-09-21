import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/presentation/screens/google_sign/login_complated.dart';
import 'package:login_page/presentation/screens/google_sign/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text("Something went wrong ");
          } else if (snapshot.hasData) {
            return const LoggedInWedget();
          }
          return const SignUp();
        },
      ),
    );
  }
}
