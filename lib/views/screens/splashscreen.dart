import 'dart:async';

import 'package:database_crud_revision/views/utils/route_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void MySplash() {
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.homepage);
        timer.cancel();
      },
    );
  }

  @override
  void initState() {
    MySplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
