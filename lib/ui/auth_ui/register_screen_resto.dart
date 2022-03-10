import 'package:flutter/material.dart';
import 'package:final_project_bootcampflutter/ui/lib_ui.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool? _isObsecure, _isObsecure2;

  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _confirmPassword = TextEditingController();

  @override
  void initState() {
    _isObsecure = true;
    _isObsecure2 = true;
    _emailController;
    _passwordController;
    _confirmPassword;
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    _confirmPassword!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthServices>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/ilustration.png",
                      height: 300,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.amber,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      cursorColor: Colors.amber,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        } else {
                          return null;
                        }
                      },
                      obscureText: _isObsecure!,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.vpn_key_rounded),
                        hintText: 'Your Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _isObsecure!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: _isObsecure!
                                  ? Color(0xffFFA801)
                                  : Color(0xffB3B5C4)),
                          onPressed: () {
                            setState(() {
                              _isObsecure = !_isObsecure!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _confirmPassword,
                      cursorColor: Colors.amber,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (_confirmPassword!.text !=
                            _passwordController!.text) {
                          return "Passwords not same";
                        }
                        return null;
                      },
                      obscureText: _isObsecure2!,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.vpn_key_rounded),
                        hintText: 'Your Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _isObsecure2!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: _isObsecure2!
                                  ? Color(0xffFFA801)
                                  : Color(0xffB3B5C4)),
                          onPressed: () {
                            setState(() {
                              _isObsecure2 = !_isObsecure2!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print('Email: ${_emailController!.text}');
                            print('Password: ${_passwordController!.text}');
                            await authService.registerSubmit(
                                _emailController, _passwordController, context);
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
