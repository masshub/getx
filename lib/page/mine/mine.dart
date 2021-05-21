import 'package:flutter/material.dart';

///
/// @author: maker
/// @date: 2021/5/20 10:14
/// description:
///
class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Center(
        child: Container(
      child: Text(
        "mine",
        style: TextStyle(fontSize: 32.0, color: Colors.blue),
      ),
    ));
  }
}
