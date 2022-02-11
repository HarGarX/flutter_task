import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_remote/core/routes/route_consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                UserCredential user = await auth.signInAnonymously();
                if (user.additionalUserInfo != null) {
                  Navigator.pushNamed(context, RouteConsts.ENTER_WIGHT_ROUTE);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.grey,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    content: Text(
                      "Coming Soon ...",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DINRegular',
                        fontSize: 21.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    duration: Duration(milliseconds: 1000),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                auth.signOut();
              },
              child: Text('LogOut'),
            ),
          ),
        ],
      )),
    );
  }
}
