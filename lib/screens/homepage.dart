import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:healthy/screens/home.dart';
import 'package:healthy/screens/profile.dart';
import 'package:healthy/screens/stepcount.dart';
import 'package:healthy/screens/tiles/exerciseTile.dart';
import 'package:healthy/screens/tiles/goals.dart';
import 'package:healthy/screens/todohome.dart';
import 'package:healthy/screens/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List _pages = [
    Home(),
    StepCounter(),
    TodoHome(),
    YoutubeVideo("https://www.youtube.com/watch?v=D0gWr9K8Lb4")
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "HealthyFy",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Diet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Video')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
