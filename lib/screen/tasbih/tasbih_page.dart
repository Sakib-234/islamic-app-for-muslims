import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int count = 0;

  counter() {
    setState(() {
      count++;
    });
  }

  reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text("Tasbih"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.white,
                        spreadRadius: 5,
                        blurRadius: 5)
                  ]),
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(20, 30, 40, 20),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 5)
                    ]),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => counter(),
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(80, 80)),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(10, 20, 30, 10),
                              shape: BoxShape.circle),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => reset(),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red),
                        child: const Text("Reset"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
