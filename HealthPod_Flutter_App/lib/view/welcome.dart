import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about_you.dart';
import 'dart:developer';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State createState() => _WelcomeState();
}

class _WelcomeState extends State {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        title: const Text(
          "Health Care",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(21))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              ' Health Care !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Image.asset(
              'assets/heart.png', // path to your heart image
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(290, 45),
                  backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
              onPressed: () {
                // Button action goes here
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  log("navigate to About You page");
                  return const AboutYou();
                }));
              },
              child: const Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
