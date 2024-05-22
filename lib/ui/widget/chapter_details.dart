import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class ChapterDetailsContainer extends StatelessWidget {
  final String chapterTitle;
  final String chapterIntro;
  final String quranVerse;

  const ChapterDetailsContainer({
    super.key,
    required this.chapterTitle,
    required this.chapterIntro,
    required this.quranVerse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Text(chapterTitle,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: greenColor, fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                Text(chapterIntro,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 21)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Divider(color: bodyBackGroundColor),
            ),
            Text(quranVerse, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
