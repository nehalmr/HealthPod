

class AboutYouModel {
  String name;
  String gender;
  int age;
  double weight;
  double height;
  String bloodGroup;
  String img;
  int? heartRate;
  int? temperatureCelcius;
  int? temperaturefarenheit;

  AboutYouModel({
    this.img='',
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    this.heartRate,
    this.temperatureCelcius,
    this.temperaturefarenheit
  });
}
