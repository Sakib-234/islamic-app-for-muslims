import 'package:flutter/material.dart';
import 'package:sakib/screen/duas/children_dua_screen.dart';
import 'package:sakib/screen/duas/devotion_dua_screen.dart';
import 'package:sakib/screen/duas/guidence_dua_screen.dart';
import 'package:sakib/screen/duas/healing_dua_screen.dart';
import 'package:sakib/screen/duas/marcy_dua_screen.dart';
import 'package:sakib/screen/duas/marriage_dua_screen.dart';
import 'package:sakib/screen/duas/parents_dua_screen.dart';
import 'package:sakib/screen/duas/patience_dua_screen.dart';
import 'package:sakib/screen/duas/protection_dua_screen.dart';
import 'package:sakib/screen/duas/sleeping_dua_screen.dart';
import 'package:sakib/screen/duas/strength_dua_screen.dart';
import 'package:sakib/screen/duas/tawbah_dua_screen.dart';
import 'package:sakib/utility/app_colors.dart';

class Duas extends StatefulWidget {
  const Duas({super.key});

  @override
  State<Duas> createState() => _DuasState();
}

class _DuasState extends State<Duas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text('Duas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 3.6,
          children: [
            _elevatedButton(
                text: 'Children',
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChildrenDua()),
                  );
                }),
            _elevatedButton(
                text: 'Devotion',
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DevotionDua()),
                  );
                }),
            _elevatedButton(
                text: 'Guidance',
                icon: const Icon(Icons.lightbulb_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GuidenceDUa()),
                  );
                }),
            _elevatedButton(
                text: 'Healing',
                icon: const Icon(Icons.healing),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HealingDua()),
                  );
                }),
            _elevatedButton(
                text: 'Marriage',
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MarriageDua()),
                  );
                }),
            _elevatedButton(
                text: 'Mercy',
                icon: const Icon(Icons.sentiment_very_satisfied),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MercyDua()),
                  );
                }),
            _elevatedButton(
                text: 'Parents',
                icon: const Icon(Icons.people),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ParentsDua()),
                  );
                }),
            _elevatedButton(
                text: 'Patience',
                icon: const Icon(Icons.timer),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PatienceDua()),
                  );
                }),
            _elevatedButton(
                text: 'Protection',
                icon: const Icon(Icons.security),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProtectionDua()),
                  );
                }),
            _elevatedButton(
                text: 'Tawbah',
                icon: const Icon(Icons.waving_hand_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TawbahDua()),
                  );
                }),
            _elevatedButton(
                text: 'Sleeping',
                icon: const Icon(Icons.nights_stay),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SleepingDua()),
                  );
                }),
            _elevatedButton(
                text: 'Strength',
                icon: const Icon(Icons.front_hand),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StrengthDua()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

ElevatedButton _elevatedButton({
  required String text,
  required Icon icon,
  required VoidCallback onPressed,
}) =>
    ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
