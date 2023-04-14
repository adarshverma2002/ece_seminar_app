import 'package:ece_seminar_app/screens/forgotPassword.dart';
import 'package:ece_seminar_app/screens/homeScreen.dart';
import 'package:ece_seminar_app/screens/signupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAuthMethods methods = context.read<FirebaseAuthMethods>();
    return Scaffold(
      backgroundColor: Color(0xFF143f40),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/evcar.png",
                  //   scale: 4,
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "RAEEUCCI",
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Fred',
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('2023',
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Fred',
                              color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Sign In to Continue",
                style: TextStyle(
                    color: Colors.white60, fontFamily: 'Tilt', fontSize: 20),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                // height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => forgotPassword()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xFFe0bb68)),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    signIn();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homePage()));
                    // methods.loginWithEmail(
                    //     email: emailController.text.trim(),
                    //     password: passwordController.text.trim(),
                    //     context: context);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFe0bb68)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => signUpPage()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xFFe0bb68)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
