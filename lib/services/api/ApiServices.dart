import 'dart:convert';
import 'package:final_project_bootcampflutter/services/model/detail_resto_models.dart';
import 'package:final_project_bootcampflutter/services/model/list_resto_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../ui/home_screen_resto.dart';

class ApiService with ChangeNotifier {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String baseUrlImage = '${_baseUrl}images/small/';
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<RestaurantResult> getListResto() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<RestaurantDetailResult> getDetailResto({required String? id}) async {
    final urlDetail = Uri.parse(_baseUrl + "detail/$id");
    final response = await http.get(urlDetail);
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
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

  registerSubmit(TextEditingController? _emailController,
      TextEditingController? _passwordController) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController!.text.toString().trim(),
          password: _passwordController!.text);
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
