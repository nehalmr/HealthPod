import 'package:demo_app1/view/aboutus.dart';
import 'package:demo_app1/view/report.dart';
import 'package:flutter/material.dart';

import 'showdialogbox.dart';

Drawer showDrawer(context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 255, 239, 239),
    width: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Health Care",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showMyDialog(context, true);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 190,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        bottomLeft: Radius.circular(45))),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.home,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ShowReport();
                    },
                  ),
                );
                const ShowReport();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 190,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        bottomLeft: Radius.circular(45))),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.graphic_eq,
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Report",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return const AboutUs();
            //         },
            //       ),
            //     );
            //     //const ShowReport();
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 20),
            //     height: 50,
            //     width: 190,
            //     decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(45),
            //             bottomLeft: Radius.circular(45))),
            //     child: const Row(
            //       children: [
            //         SizedBox(
            //           width: 8,
            //         ),
            //         Icon(
            //           Icons.graphic_eq,
            //           color: Color.fromRGBO(255, 0, 0, 1),
            //         ),
            //         SizedBox(
            //           width: 8,
            //         ),
            //         Text(
            //           "About us",
            //           style:
            //               TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    ),
  );
}
