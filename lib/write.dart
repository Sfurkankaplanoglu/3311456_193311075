import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_route_transition/page_route_transition.dart';



class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/progress.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(data);
  }
}

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {

  List<Moves> movesLists = [];
  String willSave = "";

  Future<String> getChartData(String moveName) async {
    movesLists = await DatabaseHelper.instance.getMoves(moveName);
    String data = "";

    for(var i = 0;i<movesLists.length;i++){
      data += movesLists[i].moveName.toString() + " " + movesLists[i].seta.toString() + " " +movesLists[i].rep.toString() + " " +movesLists[i].weight.toString();
      data += "\n";
    }
    return data;
  }
  String moveName = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 40,),
              Image.asset('images/savesbig.png',width: 80,),
              Container(height: 10,),
              const Text('WRITE',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 50,color: Colors.white),),
              Container(height: 15,),
              Container(
                width: 300,
                height: 200,
                child: const Center(
                    child: Text('It saves the progress of your movement named in the application to the documents folder as progress.txt.',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Mr. Rockwell',fontSize: 30,color: Colors.white),))
              ),
              Container(height: 25,),
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
                      moveName = text;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Move Name",
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
                onTap: () async {
                  if(moveName != ''){
                    willSave = await getChartData(moveName);
                    CounterStorage().writeCounter(willSave);
                    Fluttertoast.showToast(
                        msg: "Saved",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
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
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF47B5FF)
                  ),
                  child: const Center(
                    child: Text("Write The Progress",
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
              Container(height: 55,),
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
