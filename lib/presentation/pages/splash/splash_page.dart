import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //TODO: SPLASH 수정 할 것
    super.initState();
    Timer(Duration(seconds: 2),()=> context.go(RoutePath.home));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0080),
      body: Center(
        child: SvgPicture.asset("assets/svg/main_logo.svg"),
      ),
    );
  }
}
