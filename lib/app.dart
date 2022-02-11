import 'package:flutter/material.dart';
import 'package:flutter_task_remote/core/routes/route_consts.dart';
import 'package:flutter_task_remote/core/routes/route_generator.dart';
import 'package:flutter_task_remote/features/login/presentation/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: RouteConsts.LOGIN_ROUTE);
  }
}
