<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealthPod</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1, h2 {
            color: #333;
        }
        ul, ol {
            margin: 20px 0;
            padding: 0 20px;
        }
        pre {
            background: #333;
            color: #fff;
            padding: 10px;
            overflow-x: auto;
        }
        img {
            max-width: 100%;
            height: auto;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>HealthPod</h1>
    <img src="https://via.placeholder.com/150" alt="HealthPod Logo">

    <p>HealthPod is an IoT-based healthcare monitoring system developed using ESP8266, DS18B20, Pulse Sensor, and integrated with Thingspeak and Flutter UI. This project aims to provide real-time health monitoring and data visualization.</p>

    <h2>Features</h2>
    <ul>
        <li><strong>Temperature Monitoring</strong>: Uses DS18B20 sensor to measure body temperature.</li>
        <li><strong>Pulse Monitoring</strong>: Uses Pulse Sensor to measure heart rate.</li>
        <li><strong>IoT Integration</strong>: Data is sent to Thingspeak for real-time monitoring.</li>
        <li><strong>Mobile App</strong>: Flutter-based UI for easy access and visualization of health data.</li>
    </ul>

    <h2>Tech Stack</h2>
    <img src="https://via.placeholder.com/600x200" alt="Tech Stack">

    <h2>Components</h2>
    <ul>
        <li><strong>ESP8266</strong>: Microcontroller for IoT integration.</li>
        <li><strong>DS18B20</strong>: Temperature sensor.</li>
        <li><strong>Pulse Sensor</strong>: Heart rate sensor.</li>
        <li><strong>Thingspeak</strong>: IoT platform for data collection and visualization.</li>
        <li><strong>Flutter</strong>: Framework for building the mobile application.</li>
    </ul>

    <h2>Installation</h2>
    <ol>
        <li><strong>Clone the repository</strong>:
            <pre><code>git clone https://github.com/nehalmr/HealthPod.git
cd HealthPod
            </code></pre>
        </li>
        <li><strong>Set up the hardware</strong>:
            <p>Connect the DS18B20 and Pulse Sensor to the ESP8266 as per the circuit diagram provided in the repository.</p>
        </li>
        <li><strong>Configure Thingspeak</strong>:
            <p>Create an account on Thingspeak and set up a new channel. Note down the API keys and channel ID.</p>
        </li>
        <li><strong>Upload the code</strong>:
            <p>Open the Arduino IDE. Install the necessary libraries (ESP8266, DallasTemperature, OneWire, etc.). Update the WiFi credentials and Thingspeak API keys in the code. Upload the code to the ESP8266.</p>
        </li>
        <li><strong>Run the Flutter app</strong>:
            <pre><code>cd flutter_app
flutter pub get
flutter run
            </code></pre>
        </li>
    </ol>

    <h2>Usage</h2>
    <p><strong>Monitoring</strong>: Once the hardware is set up and the code is running, the sensors will start collecting data.</p>
    <p><strong>Visualization</strong>: Open the Flutter app to view real-time data. You can also log in to Thingspeak to see the data charts.</p>

    <h2>Contributing</h2>
    <p>Contributions are welcome! Please fork the repository and create a pull request with your changes.</p>

    <h2>License</h2>
    <p>This project is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for details.</p>

    <h2>Acknowledgements</h2>
    <p>Special thanks to the open-source community for providing the necessary libraries and tools.</p>
</body>
</html>
