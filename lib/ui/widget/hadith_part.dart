import 'package:flutter/material.dart';

class HadithPart extends StatelessWidget {
  final String describer;
  final String arabicText;
  final String bengaliText;

  const HadithPart({
    super.key,
    required this.describer,
    required this.arabicText,
    required this.bengaliText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$describer থেকে বর্ণিত',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.green.shade500)),
        const SizedBox(height: 8),
        Text(arabicText,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 22, fontFamily: 'kfgq')),
        const SizedBox(height: 20),
        Text(bengaliText, style: Theme.of(context).textTheme.displaySmall)
      ],
    );
  }
}
