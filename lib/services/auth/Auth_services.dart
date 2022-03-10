import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../ui/home_screen_resto.dart';

class AuthServices with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit(TextEditingController? _emailController,
      TextEditingController? _passwordController, ctx) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: _emailController!.text.toString().trim(),
              password: _passwordController!.text)
          .then(
            (value) => Navigator.of(ctx).pushReplacement(
              MaterialPageRoute(
                builder: (context) => RestaurantPage(),
              ),
            ),
          );
    } catch (e) {
      print(e);
      SnackBar(
        content: Text(
          e.toString(),
        ),
      );
    }
  }

  loginSubmit(TextEditingController? _emailController,
      TextEditingController? _passwordController, ctx) async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
              email: _emailController!.text,
              password: _passwordController!.text)
          .then((value) => Navigator.of(ctx).pushReplacement(
              MaterialPageRoute(builder: (context) => RestaurantPage())));
    } catch (e) {
      print(e);
      SnackBar(
        content: Text(
          e.toString(),
        ),
      );
    }
  }
}
