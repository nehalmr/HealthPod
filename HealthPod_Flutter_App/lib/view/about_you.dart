import 'package:demo_app1/controller/aboutyou_controller.dart';
import 'package:demo_app1/model/about_you_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import 'check_details.dart';

class AboutYou extends StatefulWidget {
  const AboutYou({super.key});

  @override
  State createState() => _AboutYouState();
}

class _AboutYouState extends State {
  bool male = false;
  bool female = false;
  bool other = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 45,
                  width: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 165, 165),
                  ),
                  child: const Text(
                    'About You',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Provider.of<AboutYouController>(context)
                    .addImage(male, female, other, context),
                Consumer(
                  builder: (context, value, child) {
                    log("Gender Consumer called");
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(70, 35),
                            backgroundColor: male
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 228, 228, 228),
                          ),
                          onPressed: () {
                            // Button action goes here

                            male = !male;
                            female = false;
                            other = false;
                            log("Male button Pressed");
                            Provider.of<AboutYouController>(context,
                                    listen: false)
                                .isGender(male);
                            Provider.of<AboutYouController>(context,
                                    listen: false)
                                .addImage(male, female, other, context);
                            setState(() {});
                          },
                          child: const Text(
                            'Male',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(70, 35),
                            backgroundColor: female
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 228, 228, 228),
                          ),
                          onPressed: () {
                            // Button action goes here

                            female = !female;
                            male = false;
                            other = false;
                            log("Female button Pressed");

                            Provider.of<AboutYouController>(context,
                                    listen: false)
                                .isGender(female);
                            Provider.of<AboutYouController>(context,
                                    listen: false)
                                .addImage(male, female, other, context);
                            setState(() {});
                          },
                          child: const Text(
                            'Female',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(70, 35),
                            backgroundColor: other
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : const Color.fromARGB(255, 228, 228, 228),
                          ),
                          onPressed: () {
                            // Button action goes here

                            other = !other;
                            male = false;
                            female = false;
                            log("Other button Pressed");
                            Provider.of<AboutYouController>(context,
                                    listen: false)
                                .isGender(other);
                            Provider.of<AboutYouController>(context,
                                    listen: false)
                                .addImage(male, female, other, context);
                            setState(() {});
                          },
                          child: const Text(
                            'Other',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    //color: const Color.fromRGBO(154, 163, 181, 1.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       blurRadius: 10,
                    //       spreadRadius: 0,
                    //       offset: Offset(0, 3),
                    //       color: Color.fromRGBO(0, 0, 0, 0.15)),
                    // ]
                  ),
                  child: TextFormField(
                    controller: nameController,

                    // textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 94, 255),
                    decoration: InputDecoration(
                        hintText: " Enter Name",
                        labelText: "Enter Name",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 47, 255),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 117, 117),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: const Color.fromRGBO(154, 163, 181, 1.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       blurRadius: 10,
                    //       spreadRadius: 0,
                    //       offset: Offset(0, 3),
                    //       color: Color.fromRGBO(0, 0, 0, 0.15)),
                    // ]
                  ),
                  child: TextFormField(
                    //textAlign: TextAlign.center,
                    controller: ageController,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 94, 255),
                    decoration: InputDecoration(
                        hintText: "Enter Age",
                        labelText: "Enter Age",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 182, 182, 182),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 47, 255),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 117, 117),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    // color: const Color.fromRGBO(154, 163, 181, 1.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       blurRadius: 10,
                    //       spreadRadius: 0,
                    //       offset: Offset(0, 3),
                    //       color: Color.fromRGBO(0, 0, 0, 0.15)),
                    // ]
                  ),
                  child: TextFormField(
                    //textAlign: TextAlign.center,
                    controller: bloodController,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 94, 255),
                    decoration: InputDecoration(
                        labelText: "Enter Blood Group",
                        hintText: "Enter Blood Group",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 47, 255),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 117, 117),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: const Color.fromRGBO(154, 163, 181, 1.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       blurRadius: 10,
                    //       spreadRadius: 0,
                    //       offset: Offset(0, 3),
                    //       color: Color.fromRGBO(0, 0, 0, 0.15)),
                    // ]
                  ),
                  child: TextFormField(
                    //textAlign: TextAlign.center,
                    controller: weightController,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 94, 255),
                    decoration: InputDecoration(
                        hintText: "Enter Weight",
                        labelText: "Enter Weight",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 47, 255),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 117, 117),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: const Color.fromRGBO(154, 163, 181, 1.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       blurRadius: 10,
                    //       spreadRadius: 0,
                    //       offset: Offset(0, 3),
                    //       color: Color.fromRGBO(0, 0, 0, 0.15)),
                    // ]
                  ),
                  child: TextFormField(
                    //textAlign: TextAlign.center,
                    controller: heightController,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    cursorColor: const Color.fromARGB(255, 0, 94, 255),
                    decoration: InputDecoration(
                        hintText: "Enter Height",
                        labelText: "Enter Height",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 47, 255),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 158, 117, 117),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 45),
                      backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
                  onPressed: () {
                    // Button action goes here
                    String str = '';
                    
                    if (male == true) {
                      str = "Male";
                    } else if (female == true) {
                      str = "Female";
                    } else {
                      str = "Other";
                    }



                  //Provider.of<AboutYouController>(context,listen: false).addImageData(context,male,female,other);

                    Provider.of<AboutYouController>(context, listen: false)
                        .addPersonDetails(
                      AboutYouModel(
                        gender: str,
                        bloodGroup: bloodController.text,
                        age: int.parse(
                          ageController.text,
                        ),
                        height: double.parse(heightController.text),
                        weight: double.parse(weightController.text),
                        name: nameController.text, 
                  
                      ),
                    );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const CheckDetails();
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
        ),
      ),
    );
  }
}
