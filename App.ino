// Executable for Arduino IDE (@nehalmr)
// Execute scripts and sensors to push data to ThinkSpeakServer
#include <ESP8266WiFi.h>
#include <OneWire.h>
#include <DallasTemperature.h>

String apiKey = "9DAO3QT17BY3ARWE"; // Enter your Write API key from ThingSpeak

const char *ssid = "Alex"; // Replace with your wifi ssid and WPA2 key
const char *pass = "10293847";
const char* server = "api.thingspeak.com";

#define ONE_WIRE_BUS D5 // Data wire is connected to GPIO 4 i.e. D2 pin of nodemcu

OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices

DallasTemperature sensors(&oneWire); // Pass our oneWire reference to Dallas Temperature sensor

WiFiClient client;

#define USE_ARDUINO_INTERRUPTS true
// Include necessary libraries
#include <PulseSensorPlayground.h>
 
// Constants
const int PULSE_SENSOR_PIN = 0;  // Analog PIN where the PulseSensor is connected
const int LED_PIN = 13;          // On-board LED PIN
const int THRESHOLD = 550;       // Threshold for detecting a heartbeat
 
// Create PulseSensorPlayground object
PulseSensorPlayground pulseSensor;

#define sw D0

float tempC=0;
float tempF=0;
int currentBPM=0;

void setup()
{
Serial.begin(9600);
delay(10);

Serial.println("Connecting to ");
Serial.println(ssid);
WiFi.begin(ssid, pass);

while (WiFi.status() != WL_CONNECTED)
{
delay(500);
Serial.print(".");
}
Serial.println("");
Serial.println("WiFi connected");

pulseSensor.analogInput(PULSE_SENSOR_PIN);
  pulseSensor.blinkOnPulse(LED_PIN);
  pulseSensor.setThreshold(THRESHOLD);
 
  // Check if PulseSensor is initialized
  if (pulseSensor.begin()) 
  {
    Serial.println("PulseSensor object created successfully!");
  }
  pinMode(sw,INPUT_PULLUP);

}
void loop() {
  // Check if the switch is pressed
  if (!digitalRead(sw)) {
    // Generate a random BPM value between 60 and 120 (adjust the range as needed)
    currentBPM = random(60, 121);
    Serial.println("Random BPM generated: " + String(currentBPM));
  } else {
    // Read temperature sensor data
    sensors.requestTemperatures();
    tempC = sensors.getTempCByIndex(0);
    tempF = sensors.getTempFByIndex(0);

    // Print temperature data
    Serial.print("Temperature in Celsius: ");
    Serial.println(tempC);
    Serial.print("Temperature in Fahrenheit: ");
    Serial.println(tempF);
  }

  // Connect to ThingSpeak
  if (client.connect(server, 80)) {
    String postStr = apiKey;
    postStr += "&field1=";
    postStr += String(tempC);
    postStr += "&field2=";
    postStr += String(tempF);
    postStr += "&field3=";
    postStr += String(currentBPM);
    postStr += "\r\n\r\n";

    // Send data to ThingSpeak
    client.print("POST /update HTTP/1.1\n");
    client.print("Host: api.thingspeak.com\n");
    client.print("Connection: close\n");
    client.print("X-THINGSPEAKAPIKEY: " + apiKey + "\n");
    client.print("Content-Type: application/x-www-form-urlencoded\n");
    client.print("Content-Length: ");
    client.print(postStr.length());
    client.print("\n\n");
    client.print(postStr);
    Serial.println("Sent data to ThingSpeak");
  }

  // Disconnect from ThingSpeak
  client.stop();

  // Delay for 15 seconds (ThingSpeak requires minimum 15 seconds delay between updates)
  Serial.println("Delay of 15 Seconds");
  delay(15000);
}