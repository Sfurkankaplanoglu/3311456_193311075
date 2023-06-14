import 'package:flutter/material.dart';
import 'main.dart';
import 'package:page_route_transition/page_route_transition.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key, required this.containerLists}) : super(key: key);
  final List<Container> containerLists;

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {

  String moveName = '';
  String weight = '';
  String set = '';
  String rep = '';
  List<Map<String,String>> moves = [];
  List<Container> realContainerLists = [];

  @override
  void initState() {
    realContainerLists = List.from(widget.containerLists);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF06283D),
        body: Column(
          children: [
            Container(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('FITSHARE',style: TextStyle(fontFamily: 'Mrs. Monster',fontSize: 40,color: Colors.white),
                ),
              ],
            ),
            Container(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Movement Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                ),
              ],
            ),
            Container(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 100),
              //width: 185,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: TextField(
                  onChanged: (text) {
                    moveName = text;
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none

                  ),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(height: 20),
            Row(
              children: [
                Container(width: 25,),
                const Text('Weight',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),),
                Container(width: 113,),
                const Text('Set',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),),
                Container(width: 70,),
                const Text('Rep',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 13,top: 10),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (text) {
                        weight = text;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none

                      ),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(width:50,),
                Container(
                  margin: const EdgeInsets.only(left: 13,top: 10),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (text) {
                        set = text;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none

                      ),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 13,top: 10),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (text) {
                        rep = text;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none

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
            Expanded(
              child: ListView(
                key: UniqueKey(),
                children: realContainerLists,
              )
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30,left: 10),
                  child: GestureDetector(child: Image.asset('images/addbutton.png'),onTap: () {
                    if(moveName != '' && weight != '' && set != '' && rep != '') {
                      moves.add({'moveName':moveName,'weight':weight,'set':set,'rep':rep});
                      setState(() {
                        realContainerLists.add(
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                              width: 165,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Center(
                                child: Text(
                                  'Weight: ${weight}Kg  Sets:${set} Rep:${rep}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                        );
                      });
                    }else {
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
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30,left: 20),
                  child: GestureDetector(child: Image.asset('images/savebutton.png'),onTap: () async {

                    await MovesNamesDatabaseHelper.instance.add(
                        MovesNames(theMoveName: moveName)
                    );

                    for (int i = 0; i < moves.length;i++) {

                      await DatabaseHelper.instance.add(
                          Moves(moveName: moves[i]['moveName'].toString(), weight: moves[i]['weight'].toString(), seta: moves[i]['set'].toString(), rep: moves[i]['rep'].toString())
                      );
                    }

                    PageRouteTransition.effect = TransitionEffect.fade;
                    PageRouteTransition.push(context, const MyApp());

                  },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
