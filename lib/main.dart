import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather/data/datasource/remote_datasource.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repository/base_weather_repository.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name.dart';
import 'package:weather/presentation/screens/Welcome_screen.dart';

void main() async{

  // BaseRemoteDataSource baseRemoteDataSource =RemoteDataSource();
  // BaseWeatherRepository baseWeatherRepository=
  // WeatherRepository(baseRemoteDataSource);
  // Weather weather= await GetWeatherByCityName(baseWeatherRepository).execute("cairo");
  // print(weather);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'j',

     //   primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}


