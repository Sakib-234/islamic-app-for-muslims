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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        color: AppColors.primaryBackgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          DateFormat('d,MMM,yyyy').format(DateTime.now()),
                          style: const TextStyle(
                              color: AppColors.textDefaultColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const Center(
              child: Text('Salat Wakto',
                  style: TextStyle(color: AppColors.textDefaultColor, fontSize: 24)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Center(
              child: Text(
                '${(currentTime.hour > 12) ? currentTime.hour - 12 : (currentTime.hour == 0) ? 12 : currentTime.hour}:${currentTime.minute}',
                style: const TextStyle(
                    color: AppColors.textDefaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: buildOptionButton(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
