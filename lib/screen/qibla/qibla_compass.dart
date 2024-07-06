import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import '../../utility/app_colors.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({super.key});

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0;

class _QiblaCompassState extends State<QiblaCompass>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final qiblaDirection = snapshot.data;
          animation = Tween(
            begin: begin,
            end: (qiblaDirection!.qiblah * (pi / 180) * -1),
          ).animate(_animationController!);

          begin = (qiblaDirection.qiblah * (pi / 180) * -1);
          _animationController!.forward(from: 0);

          return Center(
            child: SizedBox(
              child: AnimatedBuilder(
                animation: animation!,
                builder: (context, child) => Transform.rotate(
                  angle: animation!.value,
                  child: Image.asset('assets/qibla.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}