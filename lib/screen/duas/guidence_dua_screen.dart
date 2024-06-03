import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';

class GuidenceDUa extends StatelessWidget {
  const GuidenceDUa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text('Guidence'),
      ),
    );
  }
}
