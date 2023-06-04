import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather/const/const.dart';

import '../../data/datasource/remote_datasource.dart';
import '../../data/repository/weather_repository.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repository/base_weather_repository.dart';
import '../../domain/usecases/get_weather_by_city_name.dart';
import '../widgets/fade_in_animations/fade_in_animation_controller.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  TextEditingController cityNameControllor = TextEditingController();
  BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
  final controller = Get.put(FadeInAnimationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade100,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            //color: Colors.orangeAccent.shade100,
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage('assets/images/img_6'
            //         '.png'))
            ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              // Card(
              //
              //   child: Image(
              //     height: 300,
              //     width: 320,
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/img_2.png'),),
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                '  Weather \nApplication',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    letterSpacing: 1,
                    height: 1,
                    color: Colors.grey.shade800),
              ),
              SizedBox(
                height: 30,
              ),

              //  Text('Get to know the weather \nof any city just by name'),
              SizedBox(
                height: 0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200),
                  child: TextFormField(
                    controller: cityNameControllor,

                    cursorColor: Color(0xFFFCBC83),
                    decoration: InputDecoration(
                        hintText: 'Enter City Name',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orangeAccent.shade100),
                  child: MaterialButton(
                    onPressed: () async {
                      BaseWeatherRepository baseWeatherRepository =
                          WeatherRepository(baseRemoteDataSource);

                      Weather weather =
                          await GetWeatherByCityName(baseWeatherRepository)
                              .execute(cityNameControllor.text);
                      print(weather);

                      navigateTo(context, HomeScreen(weather));
                      cityNameControllor.clear();
                    },
                    child: Text(
                      'Go',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
