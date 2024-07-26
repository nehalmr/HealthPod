import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:demo_app1/view/report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future showMyDialog(BuildContext context, bool flag) async {
  AboutYouController providerObj =
      Provider.of<AboutYouController>(context, listen: false);
  if (flag) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          // shape: Size(100, 21),
          title: Center(
            child: Container(
              alignment: Alignment.center,
              width: 310,
              child: const Text(
                'My Profile',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                thickness: 2,
                color: Colors.blue,
              ),
              Container(
                  height: 150,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(154, 163, 181, 1.0),
                  ),
                  child: Image.asset(
                    Provider.of<AboutYouController>(context, listen: false)
                        .displayImage(context),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 330,
                // color: Colors.red,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(203, 206, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(154, 163, 181, 1.0),
                          blurRadius: 9)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Blood",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          providerObj.userList[0]['name']!.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          "${providerObj.userList[0]['name']!.age}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          "${providerObj.userList[0]['name']!.height}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          "${providerObj.userList[0]['name']!.height}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          "${providerObj.userList[0]['name']!.weight}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        // Text(
                        //   "${providerObj.userList[0]['name']!.heartRate}",
                        //   style: const TextStyle(
                        //       fontWeight: FontWeight.w600, fontSize: 16),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      width: 70,
                    )
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // fixedSize: const Size(300, 50),
                  backgroundColor: const Color.fromRGBO(128, 134, 255, 1),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  } 
}
