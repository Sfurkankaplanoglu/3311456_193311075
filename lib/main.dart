import 'dart:async';
import 'package:fitshare/workouts.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitshare/graphs.dart';
import 'package:fitshare/profile.dart';
import 'package:fitshare/settings.dart';
import 'package:fitshare/weather.dart';
import 'package:fitshare/write.dart';
import 'package:flutter/material.dart';
import 'addnew.dart';
import 'addweight.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    title: "App",
    home: LoginScreen(),
  ));


}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;



  @override
  void initState() {
    super.initState();
  }

  void getCurrentUser() async {
    try{
      final user = _auth.currentUser;
      if(user != null){
        loggedInUser = user;
      }
    } catch(e){
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: Column(
          children: [
            Container(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    PageRouteTransition.effect = TransitionEffect.fade;
                    PageRouteTransition.push(context, const ProfileScreen());
                  },
                  child: Image.asset('images/user.png',width: 40,),
                ),
                GestureDetector(
                  onDoubleTap: (){
                    showDialog(context: this.context, builder: (ctx) => AlertDialog(
                      title: const Text("Introducing the ultimate fitness companion - FitShare. Whether you're looking to shed a few pounds, build muscle, or simply improve your overall health, our app has everything you need to reach your fitness goals."),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(ctx).pop();
                        }, child: const Text('Ok')),
                      ],
                    ));
                  },
                  child: const Text('FITSHARE',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 70,color: Colors.white),)),
                GestureDetector(
                  onTap: () {
                    PageRouteTransition.effect = TransitionEffect.fade;
                    PageRouteTransition.push(context, const SettingsScreen());
                  },
                  child: Image.asset('images/settings.png',width: 40,),
                ),
              ],
            ),
            Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/dumbells.png',width: 300,)
              ],),
            Container(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(width: 5,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const WeatherScreen());
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Weather",
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
                  Container(width: 5,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const GraphsScreen());
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Graphs",
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
                  Container(width: 5,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const WriteScreen());
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Write",
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
                  Container(width: 5,),
                  GestureDetector(
                    onTap: () {
                      PageRouteTransition.effect = TransitionEffect.fade;
                      PageRouteTransition.push(context, const WorkoutsScreen());
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF47B5FF)
                      ),
                      child: const Center(
                        child: Text("Workouts",
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
                  Container(width: 5,),
                ],
              ),
            ),
            Container(height: 20,),
            const Text('Your Movements',style: TextStyle(color: Colors.white,fontSize: 20),),
            Expanded(
              child: FutureBuilder<List<MovesNames>>(
                  future: MovesNamesDatabaseHelper.instance.getMovesNames(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<MovesNames>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text('Lift The Damn Weights Man',textAlign: TextAlign.center,style: TextStyle(
                        fontFamily: 'Mrs. Monster',
                        fontSize: 50,
                        color: Colors.white
                      ),)
                      );
                    }
                    return ListView(
                      children: snapshot.data!.map((moves) {
                        return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 120),
                              width: 165,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(
                                child: Text(
                                  moves.theMoveName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                this.context,
                                MaterialPageRoute(builder: (context) => AddWeight(containerLists: const [],whichMove: moves.theMoveName)),
                              );
                            },
                            onLongPress: () {
                              showDialog(context: this.context, builder: (ctx) => AlertDialog(
                                title: const Text("Do you want to delete it?"),
                                actions: [
                                  TextButton(onPressed: (){
                                    setState(() {
                                      DatabaseHelper.instance.remove(moves.theMoveName);
                                      MovesNamesDatabaseHelper.instance.remove(moves.theMoveName);
                                    });

                                    Navigator.of(ctx).pop();
                                  }, child: const Text('yes')),
                                  TextButton(onPressed: () {
                                    Navigator.of(ctx).pop();
                                  }, child: const Text('no')),
                                ],
                              ));
                            }
                        );
                      }).toList(),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: GestureDetector(child: Image.asset('images/addmove.png'),onTap: () {
                PageRouteTransition.effect = TransitionEffect.fade;
                PageRouteTransition.push(context, const AddNew(containerLists: [],));
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Moves{
  final int? id;
  final String moveName;
  final String weight;
  final String seta;
  final String rep;

  Moves({this.id,required this.moveName,required this.weight, required this.seta,required this.rep});

  factory Moves.fromMap(Map<String, dynamic> json) => Moves(
    id: json["id"],
    moveName: json["moveName"],
    weight: json["weight"],
    seta: json["seta"],
    rep: json["rep"],
  );

  Map<String,dynamic> toMap() {
    return {
      "id" : id,
      "moveName" : moveName,
      "weight" : weight,
      "seta" : seta,
      "rep" : rep,
    };
  }

}

class MovesNames{
  final int? id;
  final String theMoveName;

  MovesNames({this.id,required this.theMoveName});

  factory MovesNames.fromMap(Map<String, dynamic> json) => MovesNames(
    id: json["id"],
    theMoveName: json["theMoveName"],
  );

  Map<String,dynamic> toMap() {
    return {
      "id" : id,
      "theMoveName" : theMoveName,
    };
  }

}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'movesDB.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE moves(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       moveName TEXT,
       weight TEXT,
       seta TEXT,
       rep TEXT
      )
    ''');
  }


  Future<List<Moves>> getMoves(String funcMoveName) async {
    Database db = await instance.database;
    var moves = await db.query('moves', orderBy: 'moveName',where: 'moveName = ?',whereArgs: [funcMoveName]);
    List<Moves> movesList = moves.isNotEmpty
        ? moves.map((c) => Moves.fromMap(c)).toList()
        : [];
    return movesList;
  }

  Future<int> add(Moves moves) async {
    Database db = await instance.database;
    return await db.insert('moves', moves.toMap());
  }

  Future<int> remove(String moveName) async {
    Database db = await instance.database;
    return await db.delete('moves', where: 'moveName = ?', whereArgs: [moveName]);
  }

  Future<int> removeFromWeights(String weight,String set,String rep) async {
    Database db = await instance.database;
    return await db.rawDelete("DELETE FROM moves WHERE weight = $weight AND seta = $set AND rep = $rep");
  }

}

class MovesNamesDatabaseHelper {

  MovesNamesDatabaseHelper._privateConstructor();
  static final MovesNamesDatabaseHelper instance = MovesNamesDatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'NameMovesDB.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movesNames(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       theMoveName TEXT
      )
    ''');
  }

  Future<List<MovesNames>> getMovesNames() async {
    Database db = await instance.database;
    var moves = await db.query('movesNames', orderBy: 'theMoveName');
    List<MovesNames> movesList = moves.isNotEmpty
        ? moves.map((c) => MovesNames.fromMap(c)).toList()
        : [];
    return movesList;
  }

  Future<int> add(MovesNames moves) async {
    Database db = await instance.database;
    return await db.insert('movesNames', moves.toMap());
  }

  Future<int> remove(String theMoveName) async {
    Database db = await instance.database;
    return await db.delete('movesNames', where: 'theMoveName = ?', whereArgs: [theMoveName]);
  }

}

