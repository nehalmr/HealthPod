import 'package:demo_app1/model/about_you_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thingspeak/flutter_thingspeak.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AboutYouController extends ChangeNotifier {
  List<Map<String, AboutYouModel>> userList = [];

  Image addImage(bool male, bool female, bool other, context) {
    if (male == true) {
      return Image.asset(
        'assets/maleimg.png', // path to your heart image
        width: 350,
        height: 230,
      );
    } else if (female) {
      return Image.asset(
        'assets/femaleimg.png', // path to your heart image
        width: 350,
        height: 230,
      );
    } else if (other) {
      return Image.asset(
        'assets/otherimg.png', // path to your heart image
        width: 350,
        height: 230,
      );
    } else {
      return Image.asset(
        'assets/questionMark.png', // path to your heart image
        width: 350,
        height: 230,
      );
    }
  }

  String displayImage(BuildContext context) {
    AboutYouController obj =
        Provider.of<AboutYouController>(context, listen: false);

    if (obj.userList[0]['name']!.gender == 'Male') {
      return 'assets/maleimg.png';
    } else if (obj.userList[0]['name']!.gender == 'Female') {
      return 'assets/femaleimg.png';
    } else if (obj.userList[0]['name']!.gender == 'Other') {
      return 'assets/otherimg.png';
    } else {
      return 'assets/questionMark.png';
    }
  }

  void addPersonDetails(AboutYouModel obj) {
    log("Person Details Add Succesfully");
    //String name = obj.name;
    userList.add({'name': obj});
    log("Person Details Add Succesfully");
  }

  void isGender(bool gender) {
    log("Gender add Succesfully");
    notifyListeners();
  }

  // Future<int> fetchData(context) async {
  //   log("Fetch Data Successfully");
  //   final response = await http.get(Uri.parse(
  //       'https://api.thingspeak.com/channels/2524542/feeds.json?api_key=YXS2KDE2G1K69559&results=3'));

  //   if (response.statusCode == 200) {
  //     // Parse the JSON response
  //     Map<String, dynamic> data = json.decode(response.body);
  //     if (data['feeds'] != null && data['feeds'].length > 0) {
  //       // Convert temperature string to float and then to integer
  //       double tempDouble = double.parse(data['feeds'][0]['field1']);
  //       int temp = tempDouble.toInt();
  //       return temp;
  //     }
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  //   notifyListeners();
  //   return 0;
  // }
  Future<ThingSpeakData> fetchData(context) async {
    // log("IN FE")
    // final flutterThingspeak = FlutterThingspeakClient(
    //   channelID: '2519410',
    //   readApiKey: "9IAPFH12VDY6GPRN",
    // );
    // await flutterThingspeak.initialize();

    // final response = await flutterThingspeak.getAllData();
    // // Initialize the client
    // log(response.toString());
    // flutterThingspeak.initialize();
    log("Fetch Data Successfully");
    final response = await http.get(
      Uri.parse(
          "https://api.thingspeak.com/channels/2525918/feeds.json?api_key=TLBYCJWVC3F6N0AI&results=1"),
    );
    log("${response.statusCode}");
    log(response.body.toString());
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> responseData = json.decode(response.body);
      final feeds = responseData['feeds'][0];
      return ThingSpeakData.fromJson(feeds);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ThingSpeakData {
  final int field1;
  final int field2;
  final int field3;

  ThingSpeakData(
      {required this.field1, required this.field2, required this.field3});

  factory ThingSpeakData.fromJson(Map<String, dynamic> json) {
    try {
      final field1 = double.parse(json['field1']);
      final field2 = double.parse(json['field2']);
      final field3 = double.parse(json['field3']);

      return ThingSpeakData(
        field1: field1.toInt(),
        field2: field2.toInt(),
        field3: field3.toInt(),
      );
    } catch (e) {
      print('Error parsing JSON data: $e');
      throw Exception('Error parsing JSON data');
    }
  }
}
