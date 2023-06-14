import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_route_transition/page_route_transition.dart';

class GraphsScreen extends StatefulWidget {
  const GraphsScreen({Key? key}) : super(key: key);

  @override
  State<GraphsScreen> createState() => _GraphsScreenState();
}

class _GraphsScreenState extends State<GraphsScreen> {

  final List<MovementData> _chartData = [];
  List<Moves> movesLists = [];
  String moveName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF06283D),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 10,),
                Image.asset('images/graphbig.png',width: 80,),
                Container(height: 10,),
                const Text('Graph',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 50,color: Colors.white),),
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
                  onTap: () {
                    if(moveName != ''){
                      setState(() {
                        getChartData(moveName);
                      });
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
                      child: Text("Get The Graph",
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
                _chartData.isNotEmpty ? SfCartesianChart(
                  backgroundColor: Colors.white,
                  borderColor: const Color(0xFF06283D),
                  plotAreaBorderColor: Colors.black,
                  borderWidth: 2,
                  title: ChartTitle(text: moveName,textStyle: const TextStyle(color: Colors.white)),
                  series: <ChartSeries>[
                    LineSeries<MovementData,int>(
                        dataSource: _chartData,
                        xValueMapper: (MovementData moves, _) => moves.number,
                        yValueMapper: (MovementData moves, _) => moves.weight,
                        dataLabelSettings: const DataLabelSettings(isVisible: true,),
                    ),
                  ],
                ) : const Center(child: CircularProgressIndicator()),
                Container(height: 15,),
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
          )
        )
    );
  }

  Future<List<MovementData>> getChartData(String moveName) async {
    movesLists = await DatabaseHelper.instance.getMoves(moveName);
    //print(movesLists[0].weight);
    final List<MovementData> chartData = [];

    for(var i = 0;i<movesLists.length;i++){
      _chartData.add(MovementData(i + 1, int.parse(movesLists[i].weight)));
    }
    return chartData;
  }

}

class MovementData{
  MovementData(this.number,this.weight);
  final int number;
  final int weight;
}
