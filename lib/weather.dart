import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_route_transition/page_route_transition.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String cityName = '';
  String date = '';
  String weather = '';
  String temp = '';
  WeatherFactory wf = WeatherFactory("ce9358ceadd93d862599ce69b2b64e83");

  Future<void> _fetchWeatherData() async {
    Weather w = await wf.currentWeatherByCityName(cityName);
    setState(() {
      cityName = cityName;
      date = w.date.toString();
      weather = w.weatherDescription.toString().toUpperCase();
      temp = w.temperature.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 20,),
              Image.asset('images/weatherbig.png',width: 80,),
              Container(height: 10,),
              const Text('WEATHER',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 50,color: Colors.white),),
              Container(height: 15,),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white
                ),
                child: Center(
                  child: TextField(
                    onChanged: (text) {
                      cityName = text;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter City Name",
                      hintStyle: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Mr. Rockwell',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(height: 15,),
              GestureDetector(
                onTap: () {
                  if(cityName != ''){
                    _fetchWeatherData();
                  }else{
                    showDialog(context: this.context, builder: (ctx) => AlertDialog(
                      title: const Text("You have to fill in all the blanks."),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(ctx).pop();
                        }, child: const Text('Ok')),
                      ],
                    ));
                  }
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF47B5FF)
                  ),
                  child: const Center(
                    child: Text("Get The Weather",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Mr. Rockwell',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('City:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                  Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        cityName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                  Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        date,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Weather:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                  Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        weather,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Temp:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                  Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        temp,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 50,),
              GestureDetector(
                onTap: () {
                  PageRouteTransition.effect = TransitionEffect.fade;
                  PageRouteTransition.push(context, const MyApp());
                },
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF47B5FF)
                  ),
                  child: const Center(
                    child: Text("Main Screen",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Mr. Rockwell',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
