import 'package:weather/data/datasource/remote_datasource.dart';
import 'package:weather/data/models/weather_model.dart';

import '../../domain/repository/base_weather_repository.dart';


class WeatherRepository implements BaseWeatherRepository{

  final BaseRemoteDataSource baseRemoteDataSource;
  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async{
    return (await baseRemoteDataSource.getWeatherByCityName(cityName))!;

  }
}