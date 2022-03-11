import 'package:final_project_bootcampflutter/ui/auth_ui/login_screen_resto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../ui/home_screen_resto.dart';

class AuthServices with ChangeNotifier {
  bool _isLoading = false;
// var newPassword = "";
  String? _errorMassage;
  bool get isLoading => _isLoading;
  String get pesanError => _errorMassage!;
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

  resetPassword(BuildContext context, var email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  Future signOut(BuildContext ctx) async {
    await _firebaseAuth.signOut().then((value) => Navigator.of(ctx)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  void setisLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMassage(massage) {
    _errorMassage = massage;
    notifyListeners();
  }
}
