import 'package:dio/dio.dart';
import 'package:weather/core/utils/constances.dart';
import 'package:weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel?> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByCityName(String cityName) async{
    try{
      var response = await Dio().get('${AppConstance.baseUrl}/weather?q=$cityName&appid=${AppConstance.appKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    }catch(e){
      print(e);
      return  null;

    }
  }

}