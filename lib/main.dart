import 'package:flutter/material.dart';
import 'package:flutter_nodejs_login_signup/provider/user_provider.dart';
import 'package:flutter_nodejs_login_signup/screens/home_screen.dart';
import 'package:flutter_nodejs_login_signup/screens/signup_screen.dart';
import 'package:flutter_nodejs_login_signup/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final AuthService authservice = AuthService();
    super.initState();
    authservice.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Login/Signup',
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const SignupScreen()
          : const HomeScreen(),
    );
  }
}
