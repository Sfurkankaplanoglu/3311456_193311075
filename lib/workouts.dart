import 'package:fitshare/Workouts/arm.dart';
import 'package:fitshare/Workouts/back.dart';
import 'package:fitshare/Workouts/chest.dart';
import 'package:fitshare/Workouts/fullbody.dart';
import 'package:fitshare/Workouts/leg.dart';
import 'package:fitshare/Workouts/six.dart';
import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';

import 'main.dart';


class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
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
            const Text('WORKOUTS',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
            Container(height: 5,),
            Container(
              width: 300,
              height: 385,
              child: ListView(
                children: [
                  Container(height: 25,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const ChestWorkout());
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Chest Workout",
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
                  Container(height: 25,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const BackWorkout());
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Back Workout",
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
                  Container(height: 25,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const ArmWorkout());
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Arm Workout",
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
                  Container(height: 25,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const LegWorkout());
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Leg Workout",
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
                  Container(height: 25,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const SixWorkout());
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Six Pack Workout",
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
                  Container(height: 25,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const FullbodyWorkout());
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Full Body Workout",
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
                  Container(height: 25,),
                ],
              ),
            ),
            Container(height: 60,),
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
