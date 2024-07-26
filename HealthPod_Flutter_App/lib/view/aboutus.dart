import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State createState() {
    return _AboutUsState();
  }
}

List name = [
  "Vaibhav Gawali",
  "Sayali Jadhav",
  "Nehal Rane",
  "Rushikesh Ghegade",
  "Adinath Khose",
  "Abhay Patil"
];

List phone = [
  "12345678910",
  "12345678910",
  "12345678910",
  "12345678910",
  "12345678910",
  "12345678910"
];

class _AboutUsState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/c2w.jpeg"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 180,
                  ),

                  Center(
                    child: Text(
                      "About Us",
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // const SizedBox(
                  //   child: Text(
                  //       "Welcome to our healthcare platform, where every beat matters. We are dedicated to ensuring your well-being by providing innovative solutions to measure temperature and heart rate with precision and care. At the heart of our mission is your health, and we strive to empower you with accurate information to make informed decisions about your well-being. Trust us to be your partner in monitoring your vital signs, because your health is our priority."),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                name[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              // const SizedBox(
                              //   width: 50,
                              // ),
                              const Spacer(),
                              Text(
                                phone[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                      child: Image(
                          image: AssetImage(
                    "assets/c2w.jpeg",
                  ))),
                  const Center(
                    child: Text(
                      "Thank You !",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            )));
  }
}
