import 'dart:developer';

import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckPulse extends StatefulWidget {
  const CheckPulse({Key? key}) : super(key: key);

  @override
  State createState() => _CheckPulseState();
}

class _CheckPulseState extends State<CheckPulse> {
  int heartRate = 0; // Initialize heart rate variable with default value

 
  @override
  void initState() {
    super.initState();
    fetch(); // Call fetch method when the widget is initialized
  }

  Future<void> fetchHeartRate() async {
    log("Fetching data ");
    final data = await Provider.of<AboutYouController>(context, listen: false)
        .fetchData(context); // Call fetchData() to get ThingSpeak data
    try {
      // final data = await Provider.of<AboutYouController>(context, listen: false)
      //     .fetchData(context); // Call fetchData() to get ThingSpeak data
      setState(() {
        log("${data.field3}");
        // Set the heart rate variable with the fetched value
        heartRate = data.field3;
        
      });
    } catch (e) {
      
      print('Error fetching heart rate: $e');
    }
  }

  void fetch() async {
    log("In fetch method");
    await fetchHeartRate();
  }

  @override
  Widget build(BuildContext context) {
    log("In Check Pulse build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        title: const Text(
          "Pulse",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(21))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 50),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 570,
            width: 340,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 10),
                    color: Colors.black,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 255, 241, 241)),
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE2E6EE),
                  ),
                  child: const Text(
                    'Your Result',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your Heart Data',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Icon(Icons.star),
                const Text(
                  'Heart Score',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Text(
                    "$heartRate",
                    style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(290, 45),
                      backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
                  onPressed: () {
                    Provider.of<AboutYouController>(context, listen: false)
                        .userList[0]['name']!
                        .heartRate = heartRate;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
