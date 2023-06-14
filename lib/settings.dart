import 'package:fitshare/Settings/deleteaccount.dart';
import 'package:fitshare/Settings/helpscreen.dart';
import 'package:fitshare/loginscreen.dart';
import 'package:fitshare/Settings/logout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_route_transition/page_route_transition.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final _auth = FirebaseAuth.instance;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    prefs = await SharedPreferences.getInstance();
  }

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
            Container(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/settingsbig.png',width: 150,),
              ],
            ),
            const Text('SETTINGS',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
            Container(height: 75,),
            GestureDetector(
              onTap: () {
                PageRouteTransition.effect = TransitionEffect.fade;
                PageRouteTransition.push(context, const DeleteScreen());
              },
              child: Container(
                width: 280,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red
                ),
                child: const Center(
                  child: Text("Delete The Account",
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
            Container(height: 25,),
            GestureDetector(
              onTap: () {
                //signOut();
                PageRouteTransition.effect = TransitionEffect.fade;
                PageRouteTransition.push(context, const LogOutScreen());
              },
              child: Container(
                width: 280,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF47B5FF)
                ),
                child: const Center(
                  child: Text("Sign Out",
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
            Container(height: 25,),
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
            Container(height: 25,),
            GestureDetector(
              onTap: () {
                PageRouteTransition.effect = TransitionEffect.fade;
                PageRouteTransition.push(context, const HelpScreen());
              },
              child: Container(
                width: 280,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF47B5FF)
                ),
                child: const Center(
                  child: Text("Help",
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
