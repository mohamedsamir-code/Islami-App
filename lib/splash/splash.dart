import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import '../screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const String routeName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), navigateTo);
  }

  void navigateTo() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(
        provider.appMode == ThemeMode.light
            ? 'assets/images/splashLight.png'
            : 'assets/images/splashDark.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
