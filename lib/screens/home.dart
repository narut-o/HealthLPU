import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healthy/screens/tiles/exerciseTile.dart';
import 'package:healthy/screens/tiles/goals.dart';
import 'package:healthy/screens/todohome.dart';
import 'package:healthy/screens/workout.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity',
            style: GoogleFonts.getFont('lato'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TodoHome()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(253, 253, 140, 11),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 150,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MaterialCommunityIcons.foot_print,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            'Daily Activity',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ))),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(234, 100, 11, 243),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Workouts()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MaterialCommunityIcons.bicycle,
                            color: Colors.white,
                            size: 45,
                          ),
                          Text(
                            'Workouts',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Popular Excercies",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <ExerciseTile>[
                ExerciseTile('Total Body Deep Exercise', '1',
                    "https://www.youtube.com/watch?v=VaoV1PrYft4&t=10s"),
                ExerciseTile('Weight Loss Exercise', '2',
                    "https://www.youtube.com/watch?v=xa49tsVfhXY"),
                ExerciseTile('Total Body deep exercise', '1',
                    "https://www.youtube.com/watch?v=aCuhhN5HTFg")
              ],
            ),
          ),
          Text(
            "Goals",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
            width: 40,
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GoalTiles(
                    'Walk', MaterialCommunityIcons.shoe_print, Colors.green),
                GoalTiles(
                  'Exercise',
                  MaterialCommunityIcons.run,
                  Colors.blue,
                ),
                GoalTiles(
                    'Water', MaterialCommunityIcons.water, Colors.blueAccent),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
