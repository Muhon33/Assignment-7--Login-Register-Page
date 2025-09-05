import 'package:flutter/material.dart';
import 'package:signin_register/pages/registerPage.dart';
import '../auth/auth_service.dart';
import 'profilePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authService = AuthService();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      await authService.signInWithEmailPassword(email, password);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Successful")));
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ProfilePage()),
      // );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Failed: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          ColoredBox(color: Colors.white),

          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
          ),
          Center(
            child: Column(
              children: [
                Expanded(flex: 1, child: SizedBox(height: 50)),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 88, 61, 207),
                          Color(0xff1B1464),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(120),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: height * 0.04),
                        Text(
                          "Welcome to Coursify",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(height: height * 0.04),

                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: height * 0.02),

                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Enter Pasword",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            minimumSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: login,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Have an Account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
