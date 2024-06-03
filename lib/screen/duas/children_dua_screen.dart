import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';

class ChildrenDua extends StatelessWidget {
  const ChildrenDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text('Children'),
      ),
    );
  }
}
