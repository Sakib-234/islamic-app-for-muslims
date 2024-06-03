import 'package:flutter/material.dart';
import 'package:sakib/screen/calendar/calendar_page.dart';
import 'package:sakib/screen/duas/duas_page.dart';
import 'package:sakib/screen/hadith/hadith_page.dart';
import 'package:sakib/screen/mosque/mosque_page.dart';
import 'package:sakib/screen/prayer/prayer_page.dart';
import 'package:sakib/screen/qibla/qibla_page.dart';
import 'package:sakib/screen/quran/quran_page.dart';
import 'package:sakib/screen/tasbih/tasbih_page.dart';
import 'package:sakib/screen/zakat/zakat_page.dart';
import '../../utility/app_colors.dart';

Widget buildOptionButton(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Qibla()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assistant_navigation,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Qibla",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Prayer()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_filled_rounded,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Prayer",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Quran()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Quran",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Duas()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.front_hand,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Duas",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Calendar()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Calendar",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Tasbih()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.radio_button_checked,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tasbih",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Hadith()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.drive_file_rename_outline,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Hadith",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Mosque()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mosque,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Mosque",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width / 4,
            decoration: DecorationStyles.containerDecoration,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Zakat()));
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_library_books_rounded,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Zakat",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width,
        color: AppColors.secondaryBackgroundColor,
      )
    ],
  );
}

class DecorationStyles {
  static BoxDecoration containerDecoration = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}
