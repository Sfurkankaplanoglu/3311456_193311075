import 'package:fitshare/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _auth = FirebaseAuth.instance;
  late SharedPreferences prefs;
  late String email;
  late String password;
  late String name;
  late String surname;
  late String weight;
  late String age;
  final fireStore = FirebaseFirestore.instance;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('FITSHARE',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 70,color: Colors.white),
                  ),
                ],
              ),
              Container(height: 40,),
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
                      email = text;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
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
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white
                ),
                child: Center(
                  child: TextField(
                    obscureText: true,
                    onChanged: (text) {
                      password = text;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          name = text;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
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
                  Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          surname = text;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Surname",
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
                ],
              ),
              Container(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          weight = text;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
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
                  Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          age = text;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Age",
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
                ],
              ),
              Container(height: 40,),
              GestureDetector(
                onTap: () async{
                  try{
                    if(email != '' && password != '' && name != '' && surname != '' && weight != '' && age != ''){
                      final newUser = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser != null){
                        
                        fireStore.collection("users").add({
                          'name': name,
                          'email':email,
                          'surname': surname,
                          'weight': weight,
                          'age': age
                        });
                        // prefs.setString("name", name);
                        // prefs.setString("email", email);
                        // prefs.setString("surname", surname);
                        // prefs.setString("weight", weight);
                        // prefs.setString("age", age);
                        PageRouteTransition.effect = TransitionEffect.fade;
                        PageRouteTransition.push(context, const MyApp());
                      }
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
                  }catch(e){
                    e.toString();
                  }

                },
                child: Container(
                  width: 280,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF47B5FF)
                  ),
                  child: const Center(
                    child: Text("Register",
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
      ),
    );
  }
}
