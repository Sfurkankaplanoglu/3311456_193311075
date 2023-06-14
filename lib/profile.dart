import 'package:fitshare/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String surname = '';
  String email = '';
  String weight = '';
  String age = '';
  final fireStore = FirebaseFirestore.instance;

  Future<String> getStringValuesSF(String key) async {
    await fireStore.collection("users").get().then((event) {
      for (var doc in event.docs) {
        if(key == "name"){
          name = doc.data()["name"].toString();
        }else if(key == "surname"){
          surname = doc.data()["surname"].toString();
        }else if(key == "email"){
          email = doc.data()["email"].toString();
        }else if(key == "age"){
          age = doc.data()["age"].toString();
        }else if(key == "weight"){
          weight = doc.data()["weight"].toString();
        }
      }
    });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String stringValue = prefs.getString(key).toString();
    // return stringValue;
    return "";
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
                Image.asset('images/userbig.png',width: 150,),
              ],
            ),
            const Text('PROFILE',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
            Container(height: 15,),
            FutureBuilder<String>(
              future: getStringValuesSF("name"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Name:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                      Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Container(height: 15,),
            FutureBuilder<String>(
              future: getStringValuesSF("surname"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Surname:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                      Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            surname,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Container(height: 15,),
            FutureBuilder<String>(
              future: getStringValuesSF("email"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Email:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                      Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            email,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Container(height: 15,),
            FutureBuilder<String>(
              future: getStringValuesSF("weight"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Weight:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                      Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            weight,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Container(height: 15,),
            FutureBuilder<String>(
              future: getStringValuesSF("age"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Age:',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),),
                      Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            age,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Container(height: 10,),
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
