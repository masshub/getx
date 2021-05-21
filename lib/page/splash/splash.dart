import 'package:flutter/material.dart';
import 'package:rent/plugin/getx/get.dart';
import 'package:rent/widget/mole.dart';

///
/// @author: maker
/// @date: 2021/5/20 10:14
/// description:
///
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool hadInit = false;

  String text = "";
  double fontSize = 76;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        text = "Welcome";
        fontSize = 60;
      });
    });
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        text = "GetX";
        fontSize = 60;
      });
    });
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () async {
      Get.toNamed('/splash/app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.0, -0.4),
              child: Text(
                "GetX",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 100.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kavivanar'),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.3),
              child: Text(
                text,
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: fontSize,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Mole(),
            ),
          ],
        ),
      ),
    );
  }
}
