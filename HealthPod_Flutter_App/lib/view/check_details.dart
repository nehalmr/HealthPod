import 'dart:developer';

import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:demo_app1/view/temperature_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';
import 'loading_page.dart';
import 'pulse_details.dart';
import 'temp_loading.dart';

class CheckDetails extends StatefulWidget {
  const CheckDetails({super.key});

  @override
  State createState() => _CheckDetails();
}

class _CheckDetails extends State {
  bool isLoading = true; // Flag to track loading state

  // void fetch() async {
  //   await Provider.of<AboutYouController>(context, listen: false).fetchData(
  //       context); // Call the function to fetch ThingSpeak data when the widget initializes
  // }

//   @override
//   void initState() {
//     super.initState();
//     fetchThingSpeakData();
//   }
// Future<void> fetchThingSpeakData() async {
//     try {
//       final data = await Provider.of<AboutYouController>(context). fetchData(); // Call the fetchData() function to get the ThingSpeak data
//       setState(() {
//         // Set the state to update the heartRate variable with the fetched value
//        // Assuming field1 contains the heart rate value
//        Provider.of<AboutYouController>(context).userList[0]['name']!.heartRate = data.field1;
//       });
//     } catch (e) {
//       print('Error fetching ThingSpeak data: $e');
//     }
//   }

  void gotoCheckPulse(context) async {
    log("Go to check pulse");
    // int temp = await Provider.of<AboutYouController>(context, listen: false)
    //     .fetchData(context);
    // log("$temp");
    // Provider.of<AboutYouController>(context, listen: false)
    //     .userList[0]['name']!
    //     .temperatureCelcius = temp;
    log("${Provider.of<AboutYouController>(context, listen: false).userList[0]['name']!.temperatureCelcius}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: showDrawer(context),
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
          children: [
            Image.asset(
              'assets/heartpulse.png', // path to your heart image
              width: 340,
              height: 300,
            ),
            Container(
              height: 40,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 117, 107)),
              child: GestureDetector(
                onTap: () {
                  gotoCheckPulse(context);

                  // if (isLoading) {
                  //   Navigator.pushReplacement(context,
                  //       MaterialPageRoute(builder: (BuildContext context) {
                  //     log("navigate to Pulse checkpage");
                  //     // log("${Provider.of<AboutYouController>(context, listen: false).userList[0]['name']!.temperature}");
                  //     return LoadingPage();
                  //   }));
                  // }

                  // int temp = await Provider.of<AboutYouController>(context,
                  //         listen: false)
                  //     .fetchData(context);
                  // Provider.of<AboutYouController>(context, listen: false)
                  //     .userList[0]['name']!
                  //     .temperature = temp;

                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    log("navigate to Pulse checkpage");
                    // log("${Provider.of<AboutYouController>(context, listen: false).userList[0]['name']!.temperature}");
                    // return const SplashscreenPulse();
                     return const CheckPulse();
                  }));
                },
                child: const Text(
                  "Check Pulse",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/temp.jpeg', // path to your heart image
              width: 320,
              height: 270,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 117, 107)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    log("navigate to About You page");
                    // return const SplashscreenTemp();
                    return const CheckTemperature();
                  }));
                },
                child: const Text(
                  "Temperature",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
