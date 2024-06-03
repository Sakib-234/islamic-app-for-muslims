import 'package:flutter/material.dart';
import 'package:sakib/screen/home/bottom_navigation.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: Color.fromRGBO(20, 30, 40, 25),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
              iconTheme: IconThemeData(color: Colors.white)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color.fromRGBO(40, 50, 60, 1),
            foregroundColor: const Color.fromRGBO(183, 220, 240, 10),
          )),
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 18, color: Colors.white))),
      home: const Landing(),
    );
  }
}
