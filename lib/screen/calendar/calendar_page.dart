import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.deepPurple),
          bodyText2: TextStyle(color: Colors.deepPurple),
        ),
      ),
      home: HijriCalendarPage(),
    ),
  );
}

class HijriCalendarPage extends StatefulWidget {
  const HijriCalendarPage({Key? key}) : super(key: key);

  @override
  State<HijriCalendarPage> createState() => _HijriCalendarPageState();
}

class _HijriCalendarPageState extends State<HijriCalendarPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late Map<DateTime, List> _events;
  late HijriCalendar _hijriDate;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _events = {}; // Add your events here
    _hijriDate = HijriCalendar.now(); // Initialize Hijri date
  }

  String getHijriDate() {
    HijriCalendar hijri = HijriCalendar.fromDate(_selectedDay);
    return hijri.toFormat("MMMM d, yyyy");
  }

  String getEnglishHijriDate() {
    final formatter = DateFormat('MMMM dd yyyy', 'en_US');
    final gregorianDate = hijriToGregorian(_hijriDate);
    final gregorianFormatted = formatter.format(gregorianDate);
    return '${_hijriDate.toFormat("MMMM dd yyyy")} - $gregorianFormatted';
  }

  DateTime hijriToGregorian(HijriCalendar hijriDate) {
    final gregorianDate = DateTime.utc(
      hijriDate.hYear,
      hijriDate.hMonth,
      hijriDate.hDay,
    );
    return gregorianDate;
  }



  String getAdditionalInfo(DateTime selectedDate) {
    // Example: Provide some significance based on the day of the month
    int day = selectedDate.day;
    if (day % 2 == 0) {
      return 'A special event happens on even days!';
    } else {
      return 'Celebrate uniqueness on odd days!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Hijri Calendar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return _events[day] ?? [];
            },
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontSize: 22,
                color: Colors.deepPurple,
              ),
            ),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Hijri Date:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    getHijriDate(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'DancingScript',
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:sakib/screen/calendar/selected_date.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text("Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(color: Colors.white),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: AppColors.textDefaultColor,
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: AppColors.textDefaultColor,),
              weekendStyle: TextStyle(color: AppColors.textDefaultColor,),
            ),
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(color: AppColors.textDefaultColor,),
              weekendTextStyle: TextStyle(color: AppColors.textDefaultColor,),
              selectedTextStyle: TextStyle(color: Colors.black),
              todayTextStyle: TextStyle(color: Colors.black),
              todayDecoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
          ),
          const SizedBox(
            height: 50,
          ),
          SelectedDate(today: today),
        ],
      ),
    );
  }
}*/
