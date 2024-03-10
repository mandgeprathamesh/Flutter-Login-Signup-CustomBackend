import 'package:flutter/material.dart';
import 'package:flutter_nodejs_login_signup/screens/login_screen.dart';
import 'package:flutter_nodejs_login_signup/services/auth_services.dart';
import 'package:flutter_nodejs_login_signup/utils/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthService authservice = AuthService();

  void signupUser() {
    authservice.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SignUp",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: nameController,
              hintText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 18),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 18),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: signupUser,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Text('Login User?'),
          ),
        ],
      ),
    );
  }
}
