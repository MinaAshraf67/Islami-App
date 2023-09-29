import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/radio_background.png',
          ),
          const SizedBox(
            height: 64.0,
          ),
          Text(
            'El-Quran AlKareem Station ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Image.asset(
            'assets/images/media_icons.png',
          ),
        ],
      ),
    );
  }
}
