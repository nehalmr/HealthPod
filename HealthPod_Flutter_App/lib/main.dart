import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:demo_app1/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_thingspeak/flutter_thingspeak.dart';

void main() {

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AboutYouController();
        }),
        // ChangeNotifierProvider(create: (context) {
        //   return PulseController();
        // })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
    );
  }
}
