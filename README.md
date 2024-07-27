# HealthPod (IoT Healthcare Module)

![HealthCare & IoT](https://app.lottiefiles.com/animation/c0a4b3f1-bc0b-4c07-8c5e-5cc666ede3d1)

HealthPod is an IoT-based healthcare monitoring system developed using ESP8266, DS18B20, Pulse Sensor, and integrated with Thingspeak and Flutter UI. This project aims to provide real-time health monitoring and data visualization.

## Features
- **Temperature Monitoring**: Uses DS18B20 sensor to measure body temperature.
- **Pulse Monitoring**: Uses Pulse Sensor to measure heart rate.
- **IoT Integration**: Data is sent to Thingspeak for real-time monitoring.
- **Mobile App**: Flutter-based UI for easy access and visualization of health data.

## Tech Stack
![ESP8266](https://img.shields.io/badge/ESP8266-%230071C5.svg?style=for-the-badge&logo=espressif&logoColor=white)
![DS18B20](https://img.shields.io/badge/DS18B20-FFD700.svg?style=for-the-badge)
![Pulse Sensor](https://img.shields.io/badge/Pulse%20Sensor-FF4500.svg?style=for-the-badge)
![Thingspeak](https://img.shields.io/badge/Thingspeak-000000.svg?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Arduino](https://img.shields.io/badge/Arduino-%2300979D.svg?style=for-the-badge&logo=Arduino&logoColor=white)

## Components
- **ESP8266**: Microcontroller for IoT integration.
- **DS18B20**: Temperature sensor.
- **Pulse Sensor**: Heart rate sensor.
- **Thingspeak**: IoT platform for data collection and visualization.
- **Flutter**: Framework for building the mobile application.

## Installation
1. **Clone the repository**:
    ```bash
    git clone https://github.com/nehalmr/HealthPod.git
    cd HealthPod
    ```

2. **Set up the hardware**:
    Connect the DS18B20 and Pulse Sensor to the ESP8266 as per the circuit diagram provided in the repository.

3. **Configure Thingspeak**:
    Create an account on Thingspeak and set up a new channel. Note down the API keys and channel ID.

4. **Upload the code**:
    Open the Arduino IDE. Install the necessary libraries (ESP8266, DallasTemperature, OneWire, etc.). Update the WiFi credentials and Thingspeak API keys in the code. Upload the code to the ESP8266.

5. **Run the Flutter app**:
    ```bash
    cd flutter_app
    flutter pub get
    flutter run
    ```

## Usage
- **Monitoring**: Once the hardware is set up and the code is running, the sensors will start collecting data.
- **Visualization**: Open the Flutter app to view real-time data. You can also log in to Thingspeak to see the data charts.

## Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements
Special thanks to the open-source community for providing the necessary libraries and tools.
