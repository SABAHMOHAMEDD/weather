import 'package:weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      super.id,
      super.name,
      super.main,
      super.description,
      super.humidity,
      super.pressure,
      super.temp,
      super.wind
      );

  factory WeatherModel.fromJson(Map<String,dynamic> json)=> WeatherModel(
    json["id"],
    json["name"],
    json["weather"][0]["main"],
    json["weather"][0]["description"],
    json["main"]["humidity"],
    json["main"]["pressure"],
    json["main"]["temp"],
    json["wind"]["speed"],




  );

}
