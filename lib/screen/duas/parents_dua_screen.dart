import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';

class ParentsDua extends StatelessWidget {
  const ParentsDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text('Parents'),
      ),
    );
  }
}
