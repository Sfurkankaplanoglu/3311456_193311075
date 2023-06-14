import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitshare/loginscreen.dart';
import 'package:fitshare/main.dart';
import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';


class LogOutScreen extends StatefulWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {

  final _auth = FirebaseAuth.instance;

  void signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: Column(
          children: [
            Container(height: 275,),
            Text("Do you want to sign out?",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Mr. Rockwell",color: Colors.white,fontSize: 25),),
            Container(height: 75,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    signOut();
                    PageRouteTransition.effect = TransitionEffect.fade;
                    PageRouteTransition.push(context, const LoginScreen());
                  },
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red
                    ),
                    child: const Center(
                      child: Text("Yes",
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
                GestureDetector(
                  onTap: () {
                    PageRouteTransition.effect = TransitionEffect.fade;
                    PageRouteTransition.push(context, const MyApp());
                  },
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF47B5FF)
                    ),
                    child: const Center(
                      child: Text("No",
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
            )
          ],
        ),
      ),
    );
  }
}
