import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/provider/google_sign_provider.dart';
import 'package:provider/provider.dart';

class LoggedInWedget extends StatelessWidget {
  const LoggedInWedget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: const Color.fromARGB(221, 6, 25, 56),
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogOut();
                },
                child: const Text("Log out"))
          ],
          backgroundColor: Colors.black,
          title: const Text("Signed in"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL ?? "  "),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Name : ${user.displayName}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ));
  }
}
