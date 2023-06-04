import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather/const/const.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/screens/Welcome_screen.dart';
import 'package:weather/presentation/widgets/fade_in_animations/animation_design.dart';
import 'package:weather/presentation/widgets/fade_in_animations/fade_in_animation_controller.dart';
import 'package:weather/presentation/widgets/fade_in_animations/fade_in_animation_model.dart';

class HomeScreen extends StatelessWidget {
  Weather weather;
  HomeScreen(this.weather);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    List<String> descriptionList = weather.description.split(' ');

    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade100,
      body: Stack(
        children: [
          FadeInAnimation(
            animate: AnimatePosition(
                topBefore: 0,
                bottomBefore: null,
                leftBefore: -150,
                rightBefore: null,
                topAfter: 0,
                bottomAfter: null,
                leftAfter: 0,
                rightAfter: null),
            durationInMs: 1000,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      descriptionList.length > 0
                          ? Text(
                              descriptionList[0],
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  height: 1.1,
                                  fontWeight: FontWeight.normal),
                            )
                          : Text(''),
                      descriptionList.length > 1
                          ? Text(
                              descriptionList[1],
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  height: 1.1,
                                  fontWeight: FontWeight.normal),
                            )
                          : Text('')
                    ],
                  ),
                  const SizedBox(
                    width: 250,
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.bookmark_outline_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.star_border_purple500_sharp,
                        size: 32,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          FadeInAnimation(
            animate: AnimatePosition(
                topBefore: 0,
                bottomBefore: 50,
                leftBefore: 0,
                rightBefore: 0,
                topAfter: 50,
                bottomAfter: 0,
                leftAfter: 4,
                rightAfter: 50),
            durationInMs: 1000,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 200),
              width: double.infinity,
              child: Column(
                children: [

                  (weather.temp.toInt()-273<10)?
                  Image(
                    image: AssetImage('assets/images/snow1.png'),
                    fit: BoxFit.cover,
                    height: 200,
                  ):
                  (10<weather.temp.toInt()-273&& weather.temp.toInt()-273<20)?
                  Image(
                    image: AssetImage('assets/images/img_1.png'),
                    fit: BoxFit.cover,
                    height: 200,
                  ) :
                  (10<weather.temp.toInt()-273&& weather.temp.toInt()-273<20)?
                  Image(
                    image: AssetImage('assets/images/cloudysun.png'),
                    fit: BoxFit.cover,
                    height: 200,
                  ):

                  Image(
                    image: AssetImage('assets/images/cloudysun.png'),
                    fit: BoxFit.cover,
                    height: 200,
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        weather.name,
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FadeInAnimation(
            animate: AnimatePosition(
                topBefore: 0,
                bottomBefore: null,
                leftBefore: -150,
                rightBefore: null,
                topAfter: 0,
                bottomAfter: null,
                leftAfter: 0,
                rightAfter: null),
            durationInMs: 1000,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 715, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Column(
                        children: [
                          Text('${weather.temp.toInt() - 273}\u00B0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 65,
                                fontWeight: FontWeight.w300,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                      width: 100,
                      height: 72,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '${weather.wind} Km/h',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 72,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                '${weather.humidity}%',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
