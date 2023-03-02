import 'package:dynamic_search/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Login Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Login with Google'),
              onPressed: () async => await _onLoginPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onLoginPressed(BuildContext context) async {
    GoogleSignInAccount? googleSignIn = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication = await googleSignIn?.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    await _auth.signInWithCredential(authCredential).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) => const HomeScreen()),
      );
    });
  }
}
