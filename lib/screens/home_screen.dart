import 'package:flutter/material.dart';
import 'package:flutter_nodejs_login_signup/provider/user_provider.dart';
import 'package:flutter_nodejs_login_signup/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    print("the loggedin user is :${user.name.toString()}");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.id.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Text(
              user.email.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Text(
              user.name.toString(),
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () => signOutUser(context),
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
                "Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
