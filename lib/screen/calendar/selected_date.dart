import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';

class SelectedDate extends StatelessWidget {
  const SelectedDate({
    super.key,
    required this.today,
  });

  final DateTime today;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text(
          "Selected Date : ",
          style: TextStyle(color: AppColors.textDefaultColor, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: AppColors.functionalTextBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              today.toString().split(" ")[0],
              style: const TextStyle(color: AppColors.textDefaultColor, fontSize: 24),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: AppColors.functionalTextBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              today.toString().split(" ")[0],
              style: const TextStyle(color: AppColors.textDefaultColor, fontSize: 24),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: AppColors.functionalTextBoxColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              today.toString().split(" ")[0],
              style: const TextStyle(color: AppColors.textDefaultColor, fontSize: 24),
            ),
          ),
        ),
      ],
    ));
  }
}
