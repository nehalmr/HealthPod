import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/aboutyou_controller.dart';

class ShowReport extends StatefulWidget {
  const ShowReport({super.key});

  @override
  State createState() => _ShowReportState();
}

class _ShowReportState extends State {
  @override
  Widget build(BuildContext context) {
    AboutYouController providerObj =
        Provider.of<AboutYouController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.health_and_safety_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  'My Report',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 133, 133, 133),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 350,
              // color: Colors.red,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(216, 216, 216, 1),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 243, 33, 33),
                        offset: Offset(1, 2),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "General Info",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        providerObj.userList[0]['name']!.name,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 140, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Text(
                        "${providerObj.userList[0]['name']!.age}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 140, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Text(
                        providerObj.userList[0]['name']!.gender,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 140, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Data",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        providerObj.userList[0]['name']!.bloodGroup,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 140, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Text(
                        "${providerObj.userList[0]['name']!.height}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 140, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Text(
                        "${providerObj.userList[0]['name']!.weight}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 140, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(216, 216, 216, 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 243, 33, 33),
                        offset: Offset(1, 2),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Parameter",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pulse",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Temperature[C]",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Temperature[F]",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Result",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${Provider.of<AboutYouController>(context).userList[0]['name']!.heartRate}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 135, 246),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${Provider.of<AboutYouController>(context).userList[0]['name']!.temperatureCelcius}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 135, 246),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${Provider.of<AboutYouController>(context).userList[0]['name']!.temperaturefarenheit}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 135, 246),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Units",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "BPM",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 135, 246),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "°C",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 135, 246),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "°F",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 135, 246),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
