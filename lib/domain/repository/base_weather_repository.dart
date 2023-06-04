// contract class who is connect between two layers
// n2dr nklm el data layer using el domain layer

import 'package:weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository{

   Future<Weather> getWeatherByCityName(String cityName);

}