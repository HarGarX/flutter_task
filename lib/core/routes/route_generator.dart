import 'package:flutter/material.dart';
import 'package:flutter_task_remote/features/enter_wight/presentation/pages/enter_wight_page.dart';
import 'package:flutter_task_remote/features/home/presentation/pages/home_page.dart';
import 'package:flutter_task_remote/features/login/presentation/pages/login_page.dart';

import 'route_consts.dart';

//7222081370170714044
class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteConsts.LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case RouteConsts.HOME_ROUTE:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case RouteConsts.ENTER_WIGHT_ROUTE:
        return MaterialPageRoute(
          builder: (context) => EnterWightPage(),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Error Route',
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    Container(),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'ERROR: UNKNOWN ROUTE',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
