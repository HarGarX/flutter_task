import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_remote/features/enter_wight/data/datasources/wight_DAO.dart';
import 'package:flutter_task_remote/features/enter_wight/data/models/wight_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          flex: 2,
          child: _getMessageList(),
        ),
      ),
    );
  }
}

Widget _getMessageList() {
  final wightDAO = WightDAO();

  return Expanded(
    child: FirebaseAnimatedList(
      // controller: _scrollController,
      query: wightDAO.getWightQuery(),
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
