import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_remote/core/routes/route_consts.dart';
import 'package:flutter_task_remote/features/enter_wight/data/datasources/wight_DAO.dart';
import 'package:flutter_task_remote/features/enter_wight/data/models/wight_model.dart';

class EnterWightPage extends StatefulWidget {
  EnterWightPage({Key? key}) : super(key: key);

  @override
  State<EnterWightPage> createState() => _EnterWightPageState();
}

class _EnterWightPageState extends State<EnterWightPage> {
  TextEditingController _wightController = TextEditingController();

  final wightDAO = WightDAO();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void _sendMessage() {
    final message = Wight(wight: _wightController.text, date: DateTime.now());
    wightDAO.saveMessage(message);

    _wightController.clear();
    setState(() {});
    // Navigator.pushNamed(context, RouteConsts.HOME_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            auth.signOut().then(
                  (value) =>
                      Navigator.pushNamed(context, RouteConsts.LOGIN_ROUTE),
                );
          },
          child: Text(
            "LogOut",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: _wightController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Wight',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (wight) {},
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _sendMessage();
              },
              child: Text("Submit"),
            ),
          ),
          _getMessageList(),
        ],
      )),
    );
  }
}

Widget _getMessageList() {
  final wightDAO = WightDAO();

  return Expanded(
    child: FirebaseAnimatedList(
      // controller: _scrollController,
      query: wightDAO.getWightQuery(),
      sort: (a, b) {
        return 1;
      },
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value;
        final message = Wight.fromJson(json.toString());
        return WightWidget(message.wight, message.date);
      },
    ),
  );
}

Widget WightWidget(String wight, DateTime date) {
  return Column(
    children: [
      Container(
        child: Text(wight),
      ),
      Container(
        child: Text(date.toString()),
      )
    ],
  );
}
