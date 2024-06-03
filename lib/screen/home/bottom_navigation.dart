import 'package:flutter/material.dart';
import 'package:sakib/screen/home/home_page.dart';
import 'package:sakib/screen/more/more_page.dart';
import 'package:sakib/screen/prayer/prayer_page.dart';
import 'package:sakib/screen/qibla/qibla_page.dart';
import 'package:sakib/screen/quran/quran_page.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int currentIndex = 2;
  final screens = [
    const Quran(),
    const Prayer(),
    const Home(),
    const Qibla(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(20, 30, 40, 20),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Quran"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled_rounded), label: "Prayer"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_navigation), label: "Qibla"),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: "More")
        ],
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: const Color.fromRGBO(200, 220, 240, 20),
        unselectedItemColor: const Color.fromRGBO(183, 220, 240, 10),
      ),
    );
  }
}
