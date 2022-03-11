import 'package:final_project_bootcampflutter/ui/auth_ui/login_screen_resto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../lib_ui.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    Key? key,
  }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  TextEditingController? _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resetPasswordProvider = Provider.of<AuthServices>(context);
    void showError(String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(massage),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    final emailInput = TextFormField(
      controller: _emailController,
      cursorColor: Colors.amber,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        hintText: 'Your Email',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = MaterialButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          setState(() {
            email = _emailController!.text;
          });
          resetPasswordProvider.resetPassword(context, email);
          //resetPassword();
        }
      },
      height: MediaQuery.of(context).size.height - 790,
      minWidth: resetPasswordProvider.isLoading ? null : double.infinity,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: resetPasswordProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
            )
          : Text('Send Email', style: standartStyle),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Send Email to Change Password',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 30),
                emailInput,
                SizedBox(height: 20),
                loginButton,
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        return Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Back to Login',
                        style: standartStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
