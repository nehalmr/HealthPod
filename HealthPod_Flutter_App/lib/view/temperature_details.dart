import 'dart:developer';

import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckTemperature extends StatefulWidget {
  const CheckTemperature({super.key});

  @override
  State createState() => _CheckTemperatureState();
}

class _CheckTemperatureState extends State {
  int? tempC;
  int? tempF;



  @override
  void initState() {
    super.initState();
    fetch(); // Call fetch method when the widget is initialized
  }

  Future<void> fetchTemperature() async {
    log("Fetching data ");
    final data = await Provider.of<AboutYouController>(context, listen: false)
        .fetchData(context); // Call fetchData() to get ThingSpeak data
    try {
      // final data = await Provider.of<AboutYouController>(context, listen: false)
      //     .fetchData(context); // Call fetchData() to get ThingSpeak data
      setState(() {
        log("${data.field1}");
        log("${data.field2}");
        // Set the heart rate variable with the fetched value
        tempC = data.field1;
        tempF = data.field2;
      });
    } catch (e) {
      print('Error fetching heart rate: $e');
    }
  }

  void fetch() async {
    log("In fetch method");
    await fetchTemperature();
  }

  @override
  Widget build(BuildContext context) {
    AboutYouController providerObj =
        Provider.of<AboutYouController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        title: const Text(
          "Temperature",
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
                  'Celcius',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow,
                    //border: Border.all(color: Colors.red),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.red,
                          blurRadius: 5,
                          offset: Offset(1, 10)),
                    ],
                  ),
                  child: Text(
                    "$tempC °C",
                    style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Farenheit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //shape: BoxShape.circle,
                    color: Colors.yellow,
                    // border: Border.all(color: Colors.red),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.red,
                          blurRadius: 5,
                          offset: Offset(1, 10)),
                    ],
                  ),
                  child: Text(
                    "$tempF °F",
                    style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 45),
                      backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
                  onPressed: () {
                    Provider.of<AboutYouController>(context, listen: false)
                        .userList[0]['name']!
                        .temperatureCelcius = tempC;
                    Provider.of<AboutYouController>(context, listen: false)
                        .userList[0]['name']!
                        .temperaturefarenheit = tempF;
                    setState(() {});
                    Navigator.pop(context);
                    // Button action goes here
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context) {
                    //       log("navigate to About You page");
                    //   return const AboutYou();
                    // }));
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

