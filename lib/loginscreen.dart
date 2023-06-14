import 'package:fitshare/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'package:page_route_transition/page_route_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

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
              Container(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/build.png',width: 380,)
                ],
              ),
              Container(height: 70,),
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
                        fontSize: 35,
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
              Container(height: 20,),
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
                        fontSize: 35,
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
              Container(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      try{
                        if(email != '' && password != ''){
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user != null){
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
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Login",
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
                    onTap: (){
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const RegisterScreen());
                    },
                    child: Container(
                      width: 180,
                      height: 60,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
