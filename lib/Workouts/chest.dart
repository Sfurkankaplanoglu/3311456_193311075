import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';

import '../main.dart';

class ChestWorkout extends StatefulWidget {
  const ChestWorkout({Key? key}) : super(key: key);

  @override
  State<ChestWorkout> createState() => _ChestWorkoutState();
}

class _ChestWorkoutState extends State<ChestWorkout> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: Column(
          children: [
            Container(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/workout.png',width: 150,),
              ],
            ),
            const Text('CHEST WORKOUT',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
            Container(height: 5,),
            Container(
              width: 365,
              height: 400,
              child: ListView(
                children: [
                  Container(height: 15,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                    width: 365,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Center(
                      child: Text(
                        'Name: Bench Press  Sets: 4  Rep: 12',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 5,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                    width: 365,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Center(
                      child: Text(
                        'Name: Dumbell Fly  Sets: 3  Rep: 15',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 5,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                    width: 365,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Center(
                      child: Text(
                        'Name: Incline Press  Sets: 4  Rep: 12',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 5,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                    width: 365,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Center(
                      child: Text(
                        'Name: Push Up  Sets: 3  Rep: 20',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 20,),
            GestureDetector(
              onTap: () {
                PageRouteTransition.effect = TransitionEffect.fade;
                PageRouteTransition.push(context, const MyApp());
              },
              child: Container(
                width: 280,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF47B5FF)
                ),
                child: const Center(
                  child: Text("Main Screen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
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
    );
  }
}
