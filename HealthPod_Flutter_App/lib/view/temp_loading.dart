import 'package:demo_app1/view/temperature_details.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'pulse_details.dart';

class SplashscreenTemp extends StatefulWidget {
  const SplashscreenTemp({super.key});

  @override
  _SpalshscreenState createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<SplashscreenTemp>
    with SingleTickerProviderStateMixin {

  late AnimationController _controllerTemperature;
  late Animation<double> _animationTemperature;

  @override
  void initState() {
    super.initState();

   
    // Temperature animation
    _controllerTemperature = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animationTemperature = Tween<double>(begin: 1.0, end: 1.5).animate(_controllerTemperature);

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CheckTemperature()));
    });
  }

  @override
  void dispose() {
   
    _controllerTemperature.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Temperature animation
            ScaleTransition(
              scale: _animationTemperature,
              child: Icon(
                Icons.thermostat,
                size: 80,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
