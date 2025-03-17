import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quarn_app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),(){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const OnboardingScreen()
        ));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const  Color(0xFf6A3302),
      body:Stack(
        children: [
          const Positioned(
            left: 100,
              top: 200,
              child: Text('القران الكريم',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w500),)),
          Positioned(
              top: 40,
              left: 20,
              child: SizedBox(
                  width: 347,
                  height: 136,
                  child: Image.asset('assets/images/Group 36.png'))),
          Positioned(
              bottom: 0,
              child: Image.asset('assets/images/Frame 36700.png')),
        ],
      )
    );
  }
}
