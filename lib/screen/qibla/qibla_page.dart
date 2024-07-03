import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utility/app_colors.dart';
import 'qibla_compass.dart';

class Qibla extends StatefulWidget {
  const Qibla({super.key});

  @override
  State<Qibla> createState() => _QiblaState();
}

class _QiblaState extends State<Qibla> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;

      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then(
          (value) {
            setState(
              () {
                hasPermission = (value == PermissionStatus.granted);
              },
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPermission(),
      builder: (context, snapshot) {
        if (hasPermission) {
          return const QiblaCompass();
        } else {
          return const Scaffold(
            backgroundColor: AppColors.primaryBackgroundColor,
          );
        }
      },
    );
  }
}
