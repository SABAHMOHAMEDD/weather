import 'package:weather/domain/entities/weather.dart';

import '../repository/base_weather_repository.dart';


class GetWeatherByCityName{

 final BaseWeatherRepository repository;
 GetWeatherByCityName(this.repository);
 Future<Weather> execute(String cityName)async{
   return repository.getWeatherByCityName(cityName);
 }

}