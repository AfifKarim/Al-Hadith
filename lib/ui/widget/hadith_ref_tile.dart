import 'package:flutter/material.dart';

import '../../utilils/utilities.dart';
import '../style/colors.dart';
import 'leading_tile_icon.dart';

class HadithRefTile extends StatelessWidget {
  final String iconLetter;
  final iconColor;
  final String bookName;
  final int hadithNumber;
  final String hadithCategory;
  final String categoryColor;

  const HadithRefTile({
    super.key,
    required this.iconLetter,
    this.iconColor = Colors.green,
    required this.bookName,
    required this.hadithNumber,
    required this.hadithCategory,
    // this.categoryColor = const Color(0x0000ff00),
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    Color parsedColor = parseHexColor(categoryColor);
    return ListTile(
      leading: leadingTileIcon(text: iconLetter, iconColor: iconColor),
      tileColor: Colors.white,
      title: Text(bookName, style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text('হাদিস : $hadithNumber',
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: 20, color: greenColor)),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            backgroundColor: parsedColor),
        onPressed: () {},
        child: Text(hadithCategory,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 12, color: Colors.white)),
      ),
    );
  }
}
