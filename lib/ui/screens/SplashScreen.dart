import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/screen-Background-images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ScreenBackground(widget: Center(
        child: SvgPicture.asset(
          'assets/images/mealLogo.svg',
          fit: BoxFit.scaleDown,
          width: 160,
        ),
      ),)
    );
  }
}
