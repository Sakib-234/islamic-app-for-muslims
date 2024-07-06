import 'package:flutter/material.dart';
import 'package:sakib/screen/prayer/prayer_time.dart';
import 'package:sakib/utility/app_colors.dart';

class Prayer extends StatefulWidget {
  const Prayer({super.key});

  @override
  State<Prayer> createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  var currentTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(20, 30, 40, 25),
        appBar: AppBar(
          title: const Text("Prayer Time"),
          centerTitle: true,
        ),
        body: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height / 5.5,
                      width: MediaQuery.sizeOf(context).height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${currentTime.hour}:${currentTime.minute}',
                            style: const TextStyle(
                                color: AppColors.textDefaultColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 50),
                          ),
                          const Text(
                            'No Salat',
                            style: TextStyle(
                                color: AppColors.textDefaultColor,
                                fontSize: 24),
                          )
                        ],
                      )),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(30, 40, 50, 100),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: const PrayerTime()),
                  )
                ],
              )
            );
  }
}
