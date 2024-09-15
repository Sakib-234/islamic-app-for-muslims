import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakib/screen/home/option_button.dart';
import 'package:sakib/utility/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentTime = DateTime.now();
  List<String> verses = [
    "Indeed, Allah is with those who fear Him and those who are doers of good. (Quran 16:128)",
    "And We have not sent you, [O Muhammad], except as a mercy to the worlds. (Quran 21:107)",
    "So remember Me; I will remember you. And be grateful to Me and do not deny Me. (Quran 2:152)",
    "Indeed, with hardship [will be] ease. (Quran 94:6)",
    "And We have certainly created man and We know what his soul whispers to him, and We are closer to him than [his] jugular vein. (Quran 50:16)",
    "So verily, with the hardship, there is relief. Verily, with the hardship, there is relief. (Quran 94:5-6)",
    "And whoever fears Allah - He will make for him a way out. (Quran 65:2)",
    "Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire. (Quran 2:201)",
    "Indeed, Allah does not wrong the people at all, but it is the people who are wronging themselves. (Quran 10:44)",
    "And whoever relies upon Allah - then He is sufficient for him. (Quran 65:3)",
    "He created the heavens and earth in truth. High is He above what they associate with Him. (Quran 16:3)",
    "Indeed, Allah is with those who have patience. (Quran 2:153)",
    "Say, 'He is Allah, [Who is] One, Allah, the Eternal Refuge.' (Quran 112:1-2)"
    // Add more verses here
  ];
  String selectedVerse = '';

  @override
  void initState() {
    super.initState();
    _showRandomVerse();
  }

  void _showRandomVerse() {
    final random = Random();
    selectedVerse = verses[random.nextInt(verses.length)];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Verse of the Day'),
            content: Text(selectedVerse),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  String getPrayerName(DateTime currentTime) {
    final fajrStart =  TimeOfDay(hour: 3, minute: 42);
    final fajrEnd =  TimeOfDay(hour: 5, minute: 17);
    final dhuhrStart = TimeOfDay(hour: 12, minute: 3);
    final dhuhrEnd = TimeOfDay(hour: 15, minute: 23);
    final asrStart = TimeOfDay(hour: 15, minute: 25);
    final asrEnd = TimeOfDay(hour: 18, minute: 30);
    final maghribStart = TimeOfDay(hour: 18, minute: 45);
    final maghribEnd = TimeOfDay(hour: 20, minute: 19);
    final ishaStart = TimeOfDay(hour: 20, minute: 20);
    final ishaEnd = TimeOfDay(hour: 23, minute: 59);

    TimeOfDay now = TimeOfDay(hour: currentTime.hour, minute: currentTime.minute);

    bool isInTimeRange(TimeOfDay start, TimeOfDay end, TimeOfDay current) {
      final startMinutes = start.hour * 60 + start.minute;
      final endMinutes = end.hour * 60 + end.minute;
      final currentMinutes = current.hour * 60 + current.minute;

      return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
    }

    if (isInTimeRange(fajrStart, fajrEnd, now)) {
      return 'Fajr';
    } else if (isInTimeRange(dhuhrStart, dhuhrEnd, now)) {
      return 'Dhuhr';
    } else if (isInTimeRange(asrStart, asrEnd, now)) {
      return 'Asr';
    } else if (isInTimeRange(maghribStart, maghribEnd, now)) {
      return 'Maghrib';
    } else if (isInTimeRange(ishaStart, ishaEnd, now) || (now.hour == 0 && now.minute == 0)) {
      return 'Isha';
    } else {
      return 'No Salat';
    }
  }

  @override
  Widget build(BuildContext context) {
    String prayerName = getPrayerName(currentTime);

    return Scaffold(

      body: Container(
        padding: const EdgeInsets.only(top: 50),
        color: AppColors.primaryBackgroundColor,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.postimg.cc/FKmkjcqY/istockphoto-1267297109-612x612.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Text(
                    DateFormat('d, MMM, yyyy').format(DateTime.now()),
                    style: const TextStyle(
                      color: AppColors.textDefaultColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Text(
                    '${(currentTime.hour > 12) ? currentTime.hour - 12 : (currentTime.hour == 0) ? 12 : currentTime.hour}:${currentTime.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      color: AppColors.textDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    prayerName,
                    style: const TextStyle(
                      color: AppColors.textDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height / 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: buildOptionButton(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
